import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottombarController extends GetxController {
  final SharedStates states = Get.find();
  Future<void> changeSelected(int index) async {
    Get.offAndToNamed(items[index].route);
    states.bottomBarSelectedIndex.value = index;
  }
}

class BottomItem extends SalomonBottomBarItem {
  final String route;
  final String text;
  final Icon icon;
  final Color color;

  BottomItem({
    required this.route,
    required this.text,
    required this.icon,
    this.color = Colors.blueAccent,
  }) : super(
    title: Text(text),
    icon: icon,
    selectedColor: color,
  );
}

final items = [
  BottomItem(
    text: 'Home',
    icon: Icon(Icons.home),
    route: Routes.home,
  ),
  BottomItem(
    text: 'Accounts',
    icon: Icon(Icons.manage_accounts),
    route: Routes.home,
  ),
  BottomItem(
    text: 'Notification',
    icon: Icon(FontAwesomeIcons.bell),
    route: Routes.notifications,
  ),
  BottomItem(
    text: 'Profile',
    icon: Icon(Icons.person),
    route: Routes.profile,
  ),
];

class CustomBottombar extends GetView<CustomBottombarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: controller.states.bottomBarSelectedIndex.value,
          onTap: (i) => controller.changeSelected(i),
          items: items,
        ),
      );
    });
  }
}
