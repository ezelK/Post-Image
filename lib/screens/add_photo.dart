import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:post_image/controllers/image_controller.dart';
import 'package:post_image/styles/buttons.dart';
import 'package:post_image/styles/colors.dart';
import 'package:post_image/styles/fonts.dart';
import 'package:post_image/widgets/tag.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Post",
          style: regular,
        ),
        backgroundColor: white,
        leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.clear,color: deepPurple,)),
        actions: [
          IconButton(
            onPressed: () {
              controller.addPhoto();
            },
            icon: const Icon(
              Icons.check,
              color: deepPurple,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: deepPurple),
                    ),
                    hintText: 'Title'),
                controller: controller.titleController,
              ),
              Container(
                width: Get.width * 0.8,
                height: Get.height * 0.5,
                padding: const EdgeInsets.all(32),
                child: Obx(() => controller.image.value == null
                    ? const Center(child: Icon(Icons.landscape))
                    : Image.file(
                        controller.image.value!,
                        fit: BoxFit.contain,
                      )),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: deepPurple)),
                  child: TagEditor(
                    controller: controller.tagController,
                    length: controller.tags.length,
                    hasAddButton: true,
                    tagBuilder: (context, index) => Chipp(
                      index: index,
                      label: controller.tags[index],
                      onDeleted: controller.tagOnDelete,
                    ),
                    onTagChanged: (newValue) {
                      controller.tags.add(newValue);
                    },
                    inputDecoration: const InputDecoration(
                      hintText: ' Tags',
                    ),
                    textStyle: const TextStyle(color: Colors.grey),
                    delimiters: const [',', ' '],
                    onSubmitted: (outstandingValue) {
                      controller.tags.add(outstandingValue);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        style: regularButton,
                        onPressed: controller.takePhoto,
                        icon: const Icon(Icons.camera_enhance_outlined),
                        label: const Text(
                          "Take Photo",
                          style: regular,
                        )),
                    ElevatedButton.icon(
                        style: regularButton,
                        onPressed: controller.getPhoto,
                        icon: const Icon(Icons.image),
                        label: const Text(
                          "Select Photo From Gallery",
                          style: regular,
                        )),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
