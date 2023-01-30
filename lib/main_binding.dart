
import 'package:get/instance_manager.dart';
import 'package:medical360_oth/data/source/network/api_repository.impl.dart';
import 'package:medical360_oth/data/source/local/local_repository_impl.dart';
import 'package:medical360_oth/data/repository/api_repository.dart';
import 'package:medical360_oth/data/repository/local_storage_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
