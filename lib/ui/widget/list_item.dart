import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/controllers.dart/data_controller.dart';
import 'package:maxnews/models/news.dart';
import 'package:maxnews/ui/widget/card_item.dart';

import '../../default/theme.dart';

class ListHome extends StatelessWidget {
  ListHome({
    Key? key,
    required this.title,
    // required this.function,
  }) : super(key: key);

  final String title;
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News?>(
      future: dataController.getNews(title),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: BaseTheme.marginRectangularSmall,
            itemCount: snapshot.data!.articles?.length ?? 0,
            itemBuilder: (context, index) {
              var item = snapshot.data!.articles![index];
              return CardItem(
                title: title,
                item: item,
              );
            },
          );
        } else {
          return SizedBox(
            height: Get.height * 0.8,
            width: Get.width,
            child: Center(
              child: BaseTheme.loading(),
            ),
          );
        }
      },
    );
  }
}
