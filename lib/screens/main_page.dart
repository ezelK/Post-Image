import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/controllers/image_controller.dart';
import 'package:post_image/screens/add_photo.dart';
import 'package:post_image/styles/colors.dart';
import 'package:post_image/styles/fonts.dart';
import 'package:post_image/widgets/drawer.dart';
import 'package:post_image/widgets/posts.dart';
import 'package:post_image/widgets/tags_bar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.tag_outlined),
          );
        }),
        iconTheme: const IconThemeData(color: deepPurple),
        title: const Text(
          "Images",
          style: regular,
        ),
        backgroundColor: white,
        actions: [
          AnimSearchBar(
            width: 200,
            textController: controller.searchController,
            onSuffixTap: () {
              controller.searchController.clear();
            },
          ),
          IconButton(
              onPressed: () {
                Get.to(const AddPhoto());
              },
              icon: const Icon(Icons.add_a_photo_outlined)),
        ],
      ),
      body: const PostPage(),
    );
  }
}
