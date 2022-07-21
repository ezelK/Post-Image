import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/screens/add_photo.dart';
import 'package:post_image/styles/colors.dart';
import 'package:post_image/styles/fonts.dart';
import 'package:post_image/widgets/drawer.dart';
import 'package:post_image/widgets/posts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          "Images",
          style: regular,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width * 1.5, 30.0)),
        ),
        backgroundColor: deepPurple,
        actions: [
          IconButton(onPressed: (){
            Get.to(const AddPhoto());
          }, icon: const Icon(Icons.add_a_photo_outlined))
        ],
      ),
      body: const PostPage(),
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: controller.onItemTapped,
        selectedItemColor: deepPurple,
        unselectedItemColor: ligthPurple,
        backgroundColor: white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Add Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),*/
    );
  }
}
