import 'package:debt_controller/ui/screens/add_user/add_user_screen.dart';
import 'package:debt_controller/ui/screens/list/list_screen.dart';
import 'package:debt_controller/ui/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const route="home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int botNavIndex = 0;

  onBotNavTap(index) {
    setState(() {
      botNavIndex = index;
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: botNavIndex == 0
          ? AddUserScreen()
          : botNavIndex == 1
              ? const NotificationScreen()
              :  ListScreen(),
      bottomNavigationBar: getBottomNavigation(),
    );
  }

  getBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: botNavIndex,
          onTap: onBotNavTap,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.black,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "user",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: "list",
            ),
          ],
        ),
      ),
    );
  }
}
