
import 'package:medical360_oth/exports.dart';

class CustomDialog extends StatelessWidget {
  final String? title, content, positiveBtnText, negativeBtnText, iconPath;
  final bool? showNegativeBttn, showIconCircle;
  final GestureTapCallback? positiveBtnPressed;
  final Future<bool> Function()? popAction;
  final TextAlign? contentTextAlign;

  const CustomDialog({
    super.key,
    this.showNegativeBttn = false,
    required this.title,
    this.showIconCircle = true,
    this.iconPath,
    this.contentTextAlign,
    required this.content,
    required this.popAction,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.positiveBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return WillPopScope(
      onWillPop: popAction,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            // Bottom rectangular box
            width: MediaQuery.of(context).size.width * 0.3,
            margin: EdgeInsets.only(
                top: showIconCircle!
                    ? 40
                    : 0), // to push the box half way below circle
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.only(
                top: showIconCircle! ? 60 : 20,
                left: 20,
                right: 20), // spacing inside the box
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  content!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: contentTextAlign ?? TextAlign.center,
                ),
                const SizedBox(height: 16),
                ButtonBar(
                  buttonMinWidth: 100,
                  alignment: showNegativeBttn!
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: <Widget>[
                    showNegativeBttn!
                        ? TextButton(
                            child: Text(negativeBtnText!),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kteal, width: 1.5),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: positiveBtnPressed,
                        child: Text(
                          positiveBtnText!,
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: positiveBtnPressed,
                    //   child: Text(positiveBtnText!),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          if (showIconCircle!)
            CircleAvatar(
              // Top Circle with icon
              backgroundColor: kteal,
              maxRadius: 40.0,
              child: Center(
                child: SvgIconWidget(
                  imgPath: iconPath ?? "assets/icons/warning.svg",
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
