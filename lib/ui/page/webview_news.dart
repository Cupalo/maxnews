import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/controllers.dart/data_controller.dart';
import 'package:maxnews/default/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewNews extends StatelessWidget {
  WebviewNews({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  final DataController dataController = Get.find();
  final Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: BaseTheme.appBar('WebView'),
        body: Stack(
          children: [
            WebView(
              initialUrl: url,
              onPageStarted: (url) {
                dataController.loadingPercentage.value = 0;
              },
              onProgress: (progress) {
                dataController.loadingPercentage.value = progress;
              },
              onPageFinished: (url) {
                dataController.loadingPercentage.value = 100;
              },
              // backgroundColor: Colors.transparent,
              onWebViewCreated: (controller) {
                webViewController.complete(controller);
              },
              onWebResourceError: (error) {
                BaseTheme.confirmDialog(
                  title: 'Error',
                  middleText: 'Something went wrong',
                );
                // Get.back();
              },
              gestureNavigationEnabled: true,
            ),
            FutureBuilder<WebViewController>(
              future: webViewController.future,
              builder: (context, snapshot) {
                final WebViewController? controller = snapshot.data;
                if (snapshot.connectionState != ConnectionState.done ||
                    controller == null) {
                  return Container();
                } else {
                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (await controller.canGoBack()) {
                                await controller.goBack();
                              } else {
                                BaseTheme.baseSnackbar(
                                  'No back history item',
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.reload();
                            },
                            icon: const Icon(Icons.refresh_rounded),
                          ),
                          IconButton(
                            onPressed: () async {
                              if (await controller.canGoForward()) {
                                await controller.goForward();
                              } else {
                                BaseTheme.baseSnackbar(
                                  'No forward history item',
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            if (dataController.loadingPercentage.value < 100)
              LinearProgressIndicator(
                value: dataController.loadingPercentage.value / 100.0,
                color: Colors.red,
                backgroundColor: Colors.black,
              ),
          ],
        ),
      );
    });
  }
}
