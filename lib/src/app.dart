import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/pages/search.dart';
import 'package:get/state_manager.dart';

// bottom navigation 에 대한 설정
// indexed stack

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => Scaffold(
            backgroundColor: Colors.amber,
            //appBar: AppBar(),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                const Search(),
                Container(
                  child: Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: Center(child: Text('MYPAGE')),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  //activeIcon: Image.asset(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  label: 'home',
                ),
              ],
            ),
          )),
      onWillPop: controller.willPopAction,
    );
  }
}
