import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxnews/controllers.dart/navigation_controller.dart';
import 'package:maxnews/ui/page/home.dart';
import 'package:maxnews/ui/page/search.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> listItems = [
    Home(),
    Search(),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    return Obx(() {
      return WillPopScope(
        onWillPop: () => onWillPop(preBackpress),
        child: Scaffold(
          body: listItems[navigationController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black26,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: navigationController.currentIndex.value,
            onTap: (value) {
              navigationController.changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<bool> onWillPop(DateTime preBackpress) async {
    final timegap = DateTime.now().difference(preBackpress);
    final cantExit = timegap >= const Duration(seconds: 2);
    preBackpress = DateTime.now();
    if (cantExit) {
      const snack = GetSnackBar(
        message: 'Press Back button again to Exit',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
      );
      Get.showSnackbar(snack);
      return false;
    } else {
      return true;
    }
  }
}
