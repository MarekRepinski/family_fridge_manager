import 'package:family_fridge_manager/core/constants/constants.dart';
import 'package:family_fridge_manager/data/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final LoginService controller = Get.find();
  // late N2UserData userData;

  @override
  Widget build(BuildContext context) {
    // userData = Provider.of<N2UserData>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColorLight,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 70),
            buildMenuItem(
              context: context,
              text: 'Messages',
              icon: Icons.message,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              context: context,
              text: 'Family',
              icon: Icons.family_restroom,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              context: context,
              text: 'Sign out',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 2),
              // onClicked: () {
              //   controller.signOutUser();
              //   Get.offNamed(Pages.splash.name);
              // },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required BuildContext context,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Theme.of(context).primaryColorDark;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text.tr),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Msgs(fridgeID: userData.fridgeID),
        // ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Family(fridgeID: userData.fridgeID),
        // ));
        break;
      case 2:
          controller.signOutUser();
          Get.offNamed(Pages.loading.name);
        break;
      default:
        break;
    }
  }
}
