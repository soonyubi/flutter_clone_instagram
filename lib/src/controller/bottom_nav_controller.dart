import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_instagram/src/components/message_popup.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changPage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changPage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) bottomHistory.remove(value);
    bottomHistory.add(value);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: 'Are you sure to quit?',
                okCallback: () {
                  SystemNavigator.pop();
                },
                cancelCallback: () {
                  Get.back();
                },
                title: 'system',
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      var last_idx = bottomHistory.last;
      changeBottomNav(last_idx, hasGesture: false);
      return false;
    }
  }
}
