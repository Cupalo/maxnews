import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxnews/ui/widget/base/primary_button.dart';

class BaseTheme {
  static Color selectedColor = Colors.white;
  static Color unselectedColor = Colors.grey;

  static double fontSizeNormal = 14;
  static double fontSizeSmall = 12;
  static double fontSizeVerySmall = 10;
  static double fontSizeLarge = 16;
  static double fontSizeVeryLarge = 18;

  static double margin = 8;
  static double marginSmall = 4;
  static double marginLarge = 16;

  static EdgeInsets marginAll = const EdgeInsets.all(8);
  static EdgeInsets marginAllSmall = const EdgeInsets.all(4);
  static EdgeInsets marginAllLarge = const EdgeInsets.all(16);

  static EdgeInsets marginVertical = const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets marginVerticalsmall =
      const EdgeInsets.symmetric(vertical: 4);
  static EdgeInsets marginVerticalLarge =
      const EdgeInsets.symmetric(vertical: 16);

  static EdgeInsets marginHorizontal =
      const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets marginHorizontalsmall =
      const EdgeInsets.symmetric(horizontal: 4);
  static EdgeInsets marginHorizontalLarge =
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets marginRectangular = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static EdgeInsets marginRectangularSmall = const EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 4,
  );
  static EdgeInsets marginRectangularLarge = const EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 16,
  );

  static String dateFormat(DateTime? value) {
    DateFormat dateFormat = DateFormat.yMd();
    if (value == null) {
      return '';
    } else {
      return dateFormat.format(value);
    }
  }

  static PreferredSizeWidget appBar(String title, {Color? textColor}) {
    PreferredSizeWidget appBar = AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      flexibleSpace: title == 'MAXNEWS'
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Heading.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.grey,
                    BlendMode.difference,
                  ),
                ),
              ),
            )
          : Container(),
      centerTitle: true,
      title: title == 'MAXNEWS'
          ? Container(
              margin: marginRectangularLarge,
              padding: marginRectangularLarge,
              child: const Image(
                image: AssetImage('assets/logo.png'),
              ),
            )
          : Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: title == 'MAXNEWS' ? 30 : null,
              ),
            ),
    );
    return appBar;
  }

  static Widget loading() {
    return const CircularProgressIndicator(
      color: Colors.grey,
    );
  }

  static Future<dynamic> baseDialog({
    String? title,
    String? middleText,
    Widget? content,
  }) {
    return Get.defaultDialog(
      title: title ?? '',
      middleText: middleText ?? '',
      confirm: PrimaryButton(
        onPressed: () => Get.back(),
        text: 'Ok',
      ),
    );
  }

  static Future<dynamic> confirmDialog({
    String? title,
    String? middleText,
    Widget? content,
    Function()? onConfirm,
  }) {
    return Get.defaultDialog(
      title: title ?? '',
      middleText: middleText ?? '',
      confirm: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              margin: marginHorizontal,
              onPressed: () => Get.back(),
              text: 'Cancel',
            ),
          ),
          Expanded(
            child: PrimaryButton(
              margin: marginHorizontal,
              onPressed: onConfirm ?? () {},
              text: 'Ok',
            ),
          ),
        ],
      ),
    );
  }

  static SnackbarController baseSnackbar(String message) {
    var snack = GetSnackBar(
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
    return Get.showSnackbar(snack);
  }
}
