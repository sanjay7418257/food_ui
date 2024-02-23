import 'package:flutter/material.dart';
import 'package:food_ui/view/startpage.dart';
import 'package:get/get.dart';

import 'services/detail_controller.dart';
import 'view/bottom_navigation.dart';
import 'view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/start',
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'Food_UI',
      home: const BottomNavigationScreen(),
    );
  }
}
