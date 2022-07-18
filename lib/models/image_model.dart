import 'dart:convert';

import 'package:flutter/foundation.dart';

class DImage {
  final int id;
  String title;
  String url;
  List<String> tags;
  final DateTime date;
  DImage({
    required this.id,
    required this.title,
    required this.url,
    required this.tags,
    required this.date,
  });

  String get hour =>
      "${date.hour < 10 ? "0" : ""}${date.hour} : ${date.minute < 10 ? "0" : ""}${date.minute}";

  String get diaryDate =>
      "${date.day < 10 ? "0" : ""}${date.day} / ${date.month < 10 ? "0" : ""}${date.month}/${date.year}";

  DImage copyWith({
    int? id,
    String? title,
    String? url,
    List<String>? tags,
    DateTime? date,
  }) {
    return DImage(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      tags: tags ?? this.tags,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'url': url});
    result.addAll({'tags': tags});
    result.addAll({'date': date.millisecondsSinceEpoch});

    return result;
  }

  factory DImage.fromMap(Map<String, dynamic> map) {
    return DImage(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      tags: List<String>.from(map['tags']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DImage.fromJson(String source) => DImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DImage(id: $id, title: $title, url: $url, tags: $tags, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DImage &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        listEquals(other.tags, tags) &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        tags.hashCode ^
        date.hashCode;
  }
}
