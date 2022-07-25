import 'dart:collection';
import 'dart:math';
import 'package:post_image/models/create_image.dart';
import 'package:post_image/models/image_model.dart';

class Api {
  static final List<DImage> data = [
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "music",
          "strange",
          "cartoon",
          "color",
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
    DImage(
        id: 1,
        title:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus eu sem vel accumsan.",
        url:
            "https://cdn2.dokuzsoft.com/u/edessakitabevi/img/b/r/i/rick-and-morty-sayi-39-rick-and-morty-marmara-cizgi-0-904-45-b-1622496171.jpg",
        tags: [
          "rick",
          "morty",
          "cartoon",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy",
          "strange",
          "funny",
          "crazy"
        ],
        date: DateTime.now()),
  ];

  static Future<List<DImage>?> getImages(
      String search, List<String> tags, int page) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final results = Api.data
        .where((e) =>
            (search.isEmpty || e.title.contains(search)) &&
            (tags.isEmpty || tags.any((element) => e.tags.contains(element))))
        .toList();

    return results.sublist((page - 1) * 10, min(page * 10, results.length));
  }

  static Future<DImage?> addImage(CreateImage create) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final dImage = DImage(
        id: Api.data.length,
        title: create.title,
        url: create.url,
        tags: create.tags,
        date: DateTime.now());
    Api.data.insert(0, dImage);
    return dImage;
  }

  static Future<List<String>> getTags() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final allTags = data.map((e) => e.tags).toList();
    final tags = HashSet<String>();

    for (final t in allTags) {
      tags.addAll(t);
    }

    return tags.toList();
  }
}
