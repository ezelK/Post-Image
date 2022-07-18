import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/screens/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}
