import 'package:flutter/material.dart';
import 'package:ui_socialnetworking/Configurations.dart';
import 'package:ui_socialnetworking/Widgets/WidgetLibrary.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfigurations.BackgorundColor,
      appBar: MainAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 5, top: 20, right: 5),
        child: Column(
          children: [
            Text(
              "Welcome Jerry!",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Have a look at Events around you",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            EventSelector(),
            SizedBox(
              height: 50,
            ),
            Text(
              "Find your Friends who are Online..",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            UserSelector(),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(),
    );
  }
}
