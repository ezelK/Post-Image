import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/controllers/image_controller.dart';
import 'package:post_image/styles/colors.dart';

class TagsWidget extends GetView<ImageController> {
  const TagsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Obx(
                  () => Wrap(
                    children: controller.searchTags
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectedTags.contains(e)
                                      ? controller.selectedTags.remove(e)
                                      : controller.selectedTags.add(e);
                                },
                                child: Chip(
                                  side: BorderSide(color: controller.selectedTags.contains(e)
                                          ? white
                                          : deepPurple,),
                                  backgroundColor:
                                      controller.selectedTags.contains(e)
                                          ? deepPurple
                                          : white,
                                  labelPadding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  label: Text(
                                    e,
                                    style:  TextStyle(
                                      fontFamily: 'Arima',
                                      color: controller.selectedTags.contains(e)
                                          ? white
                                          : deepPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
      ),
    
      );
  }
}