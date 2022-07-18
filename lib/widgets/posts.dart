import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/controllers/image_controller.dart';
import 'package:post_image/widgets/image_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    return Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await controller.reset();
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.listLength,
                  itemBuilder: (ctx, idx) {
                    if (idx < controller.data.length) {
                      return ImageWidget(image: controller.data[idx]);
                    }
                    controller.fetch();
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
      );
  }
}