import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planetapp/screen/Home/view/Homepage.dart';
import 'package:planetapp/screen/Info/view/infopage.dart';


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => const infoscreen(),
        ),
      ],
    ),
  );
}