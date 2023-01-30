import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownloader {
  static FileDownloader? _instance;

  FileDownloader._internal();

  factory FileDownloader() => _instance ??= FileDownloader._internal();

  Future<String?> createDownloadTask(
      {required String url, required String fileName}) async {
    FlutterDownloader.registerCallback(downloadCallback);
    final ReceivePort _port = ReceivePort();

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getDownloadsDirectory();
      print(directory?.path);
    } else if (Platform.isAndroid) {
      directory = await getTemporaryDirectory();
    }
    if (directory == null) {
      throw Exception('Could not access local storage for '
          'download. Please try again.');
    }
    String savedDir = '${directory.path}/$fileName';

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (status == DownloadTaskStatus.complete) {
        _saveFile(savedDir);
      }
    });

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: directory.path,
      saveInPublicStorage: true,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
    return taskId;
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  _saveFile(String directoryPath) async {
    if (Platform.isAndroid) {
      final params = SaveFileDialogParams(sourceFilePath: directoryPath);
      final filePath = await FlutterFileDialog.saveFile(params: params);

      print('Download path: $filePath');
    }
    dispose();
  }

//   _download({required String fileName}) async {
//     Directory? directory;
//     if (Platform.isIOS) {
//       directory = await getDownloadsDirectory();
//       print(directory?.path);
//     } else if (Platform.isAndroid) {
//       directory = await getTemporaryDirectory();
//     }
//     if (directory == null) {
//       throw Exception('Could not access local storage for '
//           'download. Please try again.');
//     }

//     _saveFile('${directory.path}/$filename');
// }

//   }

}
