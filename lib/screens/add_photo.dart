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
      ),
      body: ListView(
         physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
         ),
        children: [
        TextField(
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
          () => TagEditor(
            length: controller.tags.length,
            hasAddButton: true,
            resetTextOnSubmitted: true,
            tagBuilder: (context, index) => Chipp(
              index: index,
              label: controller.tags[index],
              onDeleted: controller.tagOnDelete,
            ),
            onTagChanged: (newValue) {
              controller.tags.add(newValue);
            },
            inputDecoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Hint Text...',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                style: regularButton,
                onPressed: controller.takePhoto,
                icon: const Icon(Icons.camera),
                label: const Text(
                  "Take Photo",
                  style: regular,
                )),
            ElevatedButton.icon(
                style: regularButton,
                onPressed: controller.getPhoto,
                icon: const Icon(Icons.image),
                label: const Text("Select Photo From Gallery")),
          ],
        )
      ]),
    );
  }
}
