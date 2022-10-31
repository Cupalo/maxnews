import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/controllers.dart/data_controller.dart';
import 'package:maxnews/default/theme.dart';

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
            // const Text('Search'),
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
