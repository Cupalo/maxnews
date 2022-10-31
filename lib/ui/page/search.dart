import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/controllers.dart/data_controller.dart';
import 'package:maxnews/default/theme.dart';

import '../widget/card_item.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseTheme.appBar('MAXNEWS'),
      body: Obx(() {
        return Column(
          children: [
            // const SizedBox(height: kToolbarHeight),
            const SizedBox(height: 16),
            Container(
              margin: BaseTheme.marginRectangular,
              padding: BaseTheme.marginAll,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black26,
              ),
              child: Container(
                padding: BaseTheme.marginAll,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: dataController.query.value,
                        onChanged: (value) {
                          dataController.query.value = value;
                        },
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(left: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.search),
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: dataController.searchLoading.isTrue
                  ? Center(
                      child: BaseTheme.loading(),
                    )
                  : dataController.listNews.value.articles == null
                      ? Container()
                      : dataController.listNews.value.articles!.isEmpty
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : ListView.builder(
                              padding: BaseTheme.marginRectangularSmall,
                              itemCount: dataController
                                  .listNews.value.articles!.length,
                              itemBuilder: (context, index) {
                                var item = dataController
                                    .listNews.value.articles![index];
                                return CardItem(
                                  item: item,
                                );
                              },
                            ),
            )
          ],
        );
      }),
    );
  }

  onPressed() {
    if (Get.focusScope != null) {
      if (Get.focusScope!.hasFocus) {
        Get.focusScope!.unfocus();
      }
    }
    if (dataController.query.isNotEmpty) {
      dataController.searchNews(dataController.query.value);
    } else {
      BaseTheme.baseDialog(
        title: 'Warning',
        middleText: 'Please write the news you want to find',
      );
    }
  }
}
