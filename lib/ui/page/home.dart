import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/api/base_api.dart';
import 'package:maxnews/controllers.dart/data_controller.dart';
import 'package:maxnews/default/theme.dart';
import 'package:maxnews/ui/widget/base/primary_button_text.dart';
import 'package:maxnews/ui/widget/list_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTheme.appBar(
        'MAXNEWS',
      ),
      body: Obx(() {
        return Column(
          children: [
            pageTitle(dataController.pageIndex.value),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  dataController.pageIndex.value = value;
                  pageController.jumpToPage(value);
                },
                controller: pageController,
                children: [
                  ListHome(
                    title: BaseApi.nationalTitle,
                  ),
                  ListHome(
                    title: BaseApi.internationalTitle,
                  ),
                  ListHome(
                    title: BaseApi.businessTitle,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget pageTitle(int pageIndex) {
    return Container(
      padding: BaseTheme.marginRectangular,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryButtonText(
            text: BaseApi.nationalTitle,
            onPressed: () {
              pageController.jumpToPage(0);
            },
            color: pageIndex == 0
                ? BaseTheme.selectedColor
                : BaseTheme.unselectedColor,
          ),
          PrimaryButtonText(
            text: BaseApi.internationalTitle,
            onPressed: () {
              pageController.jumpToPage(1);
            },
            color: pageIndex == 1
                ? BaseTheme.selectedColor
                : BaseTheme.unselectedColor,
          ),
          PrimaryButtonText(
            text: BaseApi.businessTitle,
            onPressed: () {
              pageController.jumpToPage(2);
            },
            color: pageIndex == 2
                ? BaseTheme.selectedColor
                : BaseTheme.unselectedColor,
          ),
        ],
      ),
    );
  }
}
