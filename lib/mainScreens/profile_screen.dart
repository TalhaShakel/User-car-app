import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:users_app/controller.dart';
import 'package:users_app/global/global.dart';
import 'package:users_app/widgets/info_design_ui.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(Maincontroller());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //name
            Text(
              userModelCurrentInfo!.name!,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: theme.primaryColor,
                height: 2,
                thickness: 2,
              ),
            ),

            const SizedBox(
              height: 38.0,
            ),

            //phone
            InfoDesignUIWidget(
              textInfo: userModelCurrentInfo!.phone!,
              iconData: Icons.phone_iphone,
            ),

            //email
            InfoDesignUIWidget(
              textInfo: userModelCurrentInfo!.email!,
              iconData: Icons.email,
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  // SystemNavigator.pop();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54,
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            Obx(() => IconButton(

                // tooltip: "asd",
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(
                  controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                  color: theme.iconTheme.color,
                ))),
            Text(
              controller.isDark.value ? " Dark mode" : "Light mode",
              style: TextStyle(color: theme.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
