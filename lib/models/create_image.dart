import 'dart:convert';

import 'package:flutter/foundation.dart';

class CreateImage {
  final String title;
  final List<String> tags;
  final String url;
  CreateImage({
    required this.title,
    required this.tags,
    required this.url,
  });

  CreateImage copyWith({
    String? title,
    List<String>? tags,
    String? url,
  }) {
    return CreateImage(
      title: title ?? this.title,
      tags: tags ?? this.tags,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'tags': tags});
    result.addAll({'url': url});

    return result;
  }

  factory CreateImage.fromMap(Map<String, dynamic> map) {
    return CreateImage(
      title: map['title'] ?? '',
      tags: List<String>.from(map['tags']),
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateImage.fromJson(String source) =>
      CreateImage.fromMap(json.decode(source));

  @override
  String toString() => 'CreateImage(title: $title, tags: $tags, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateImage &&
        other.title == title &&
        listEquals(other.tags, tags) &&
        other.url == url;
  }

  @override
  int get hashCode => title.hashCode ^ tags.hashCode ^ url.hashCode;
}
