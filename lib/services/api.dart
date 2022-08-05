import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:post_image/models/create_image.dart';
import 'package:post_image/models/image_model.dart';

class Api {
  /*static final List<DImage> data = [
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
*/

  static Future dioAuth() async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: "http://78.189.154.147", responseType: ResponseType.json);
    return Dio(baseOptions);
  }

  static Future<List<DImage>?> getPosts(
      String search, List<String> tags, int page) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/picture", queryParameters: {
        "search": search,
        "tags": tags.join(","),
        "page": page,
      });
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => DImage.fromMap(e)).toList();
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Get Posts Error $err");
      return null;
    }
  }

  static Future<DImage?> addImage(CreateImage create) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.post("/picture", data: create.toForm());
      if (response.statusCode == 200) {
        return DImage.fromMap(response.data);
      }
      return null;
    } on DioError catch (err) {
      debugPrint("Create Image Error $err");
      return null;
    }
  }

  static Future<List<String>> getTags() async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/tags");
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data;
        return list.map((e) => e.toString()).toList();
      }
      return [];
    } on DioError catch (err) {
      debugPrint("Get Posts Error $err");
      return [];
    }
  }
}
