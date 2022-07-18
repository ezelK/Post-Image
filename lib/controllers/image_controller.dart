import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_image/models/image_model.dart';
import 'package:post_image/services/api.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final ImagePicker picker = ImagePicker();

  final int limit = 10;
  int page = 1;
  int lastCount = 0;
  int selectedIndex = 0;

  bool get hasMore => lastCount == limit;
  int get listLength => data.length + (hasMore ? 1 : 0);

  final data = <DImage>[].obs;
  final isLoading = false.obs;
  final searchController = TextEditingController();
  final searchText = "".obs;
  final selectedTags = <String>[].obs;

  final titleController = TextEditingController();

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
}
