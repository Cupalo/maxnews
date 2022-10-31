import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/default/theme.dart';
import 'package:maxnews/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(Navigation()),
    );
    return Scaffold(
      body: Container(
        padding: BaseTheme.marginAllLarge,
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
