import 'package:dio/dio.dart';

class CreateImage {
  final String title;
  final List<String> tags;
  final List<int> imageBytes;

  CreateImage({
    required this.title,
    required this.tags,
    required this.imageBytes,
  });

  FormData toForm() {
    return FormData.fromMap({
      "title": title,
      "tags": tags.join(","),
      "image": MultipartFile.fromBytes(imageBytes, filename: "image.jpg"),
    });
  }
}
