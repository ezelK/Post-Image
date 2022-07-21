import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/controllers/image_controller.dart';
import 'package:post_image/styles/colors.dart';
import 'package:post_image/styles/fonts.dart';

class NavigationDrawerWidget extends GetView<ImageController> {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: deepPurple,
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.03)),
                leading: const Icon(Icons.search_outlined, color: Colors.white),
                title: TextField(
                    controller: controller.searchController,
                    style: regular),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
