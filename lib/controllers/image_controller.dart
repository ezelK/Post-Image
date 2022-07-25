import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/models/create_image.dart';
import 'package:post_image/models/image_model.dart';
import 'package:post_image/services/api.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final tags = <String>[].obs;
  final int limit = 10;
  int page = 1;
  int lastCount = 0;
  int selectedIndex = 0;
  final date = DateTime.now().obs;
  late DImage x;

  bool get hasMore => lastCount == limit;
  int get listLength => data.length + (hasMore ? 1 : 0);

  final data = <DImage>[].obs;
  final isLoading = false.obs;
  final searchText = "".obs;
  final searchController = TextEditingController();
  final selectedTags = <String>[].obs;
  final titleController = TextEditingController();
  final tagController = TextEditingController();

  final image = Rxn<File>();

  Future<void> takePhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      image.value = File(photo.path);
    }
  }

  Future<void> getPhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      image.value = File(photo.path);
    }
  }

  @override
  void onInit() {
    reset();
    debounce(selectedTags, (_) {
      reset();
    }, time: const Duration(milliseconds: 300));
    
    searchController.addListener(() {
      searchText.value = searchController.text;
    });

    debounce(searchText, (_) {
      reset();
    }, time: const Duration(milliseconds: 300));
    super.onInit();
  }

  void clear() {
    page = 1;
    lastCount = 0;
    data.clear();
  }

  Future<void> reset() async {
    clear();
    isLoading.value = true;
    await fetch();
    isLoading.value = false;
  }

  Future<void> fetch() async {
    final result = await Api.getImages(searchText.value, selectedTags, page);
    if (result == null) return;
    page += 1;
    lastCount = result.length;
    data.addAll(result);
  }

  void tagOnDelete(int index) {
    tags.removeAt(index);
    tags.refresh();
  }

  void addPhoto() async {
    final createImage = CreateImage(
        title: titleController.text,
        tags: tags
            .map((element) => element)
            .toList(), //created tags' copy to write after delete tags
        url:
            "https://i.pinimg.com/736x/f0/71/34/f07134b6c562bc53d65b69dec2ac5ca4.jpg");
    if (titleController.text != "" && tags.isNotEmpty) {
      final post = await Api.addImage(createImage);
      if (post == null) {
        return;
      }
      if (post.date.year == date.value.year &&
          post.date.month == date.value.month &&
          post.date.day == date.value.day) data.insert(0, post);
      Get.back();
      titleController.clear();
      tags.clear();
    }
  }
}
