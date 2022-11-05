
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatefulWidget
{

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          //image
          Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/car_logo.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [
            //company name
              const Text(
                "Oasis",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20,),

              //about you And your company name info
           const Text(
             "This app has been developed by Merhawi "
             "This is the world number one ride sharing app. Available for all "
             "10K+ people already use this App ",
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 16,
               color: Colors.white54,
             ),
           ),

              const SizedBox(height: 20,),

              const Text(
                "This app has been developed by Merhawi "
                "This is the world number one ride sharing app. Available for all "
                 "10K+ people already use this App ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(height: 40,),

              //close button
              ElevatedButton(
                  onPressed: ()
                  {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white54,
                  ),
                  child: const Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
          ],
          )
        ],
      ),
    );
  }
}
