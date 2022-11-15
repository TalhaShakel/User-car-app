import 'package:flutter/material.dart';
import 'package:users_app/Support/support.dart';
import 'package:users_app/mainScreens/about_screen.dart';
import 'package:users_app/mainScreens/profile_screen.dart';
import 'package:users_app/mainScreens/trips_history_screen.dart';
import 'package:users_app/splashScreen/splash_screen.dart';

import '../global/global.dart';

class MyDrawer extends StatefulWidget {
  String? name;
  String? email;

  MyDrawer({
    this.name,
    this.email,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
          //drawer header
          Container(
            height: 165,
            color: theme.scaffoldBackgroundColor,
            child: DrawerHeader(
              decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: theme.primaryColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.email.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 12.0,
          ),

          //drawer body
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => TripsHistoryScreen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.history,
                color: theme.primaryColor,
              ),
              title: Text(
                "History",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => ProfileScreen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: theme.primaryColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => AboutScreen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: theme.primaryColor,
              ),
              title: Text(
                "About",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => Support_page(
                          )));
            },
            child: ListTile(
              leading: Icon(
                Icons.support_agent,
                color: theme.primaryColor,
              ),
              title: Text(
                "Support",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              fAuth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const MySplashScreen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: theme.primaryColor,
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
