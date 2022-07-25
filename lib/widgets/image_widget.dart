import 'package:flutter/material.dart';
import 'package:post_image/models/image_model.dart';
import 'package:post_image/styles/colors.dart';
import 'package:post_image/styles/fonts.dart';
import 'package:post_image/widgets/custom_cached_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.image}) : super(key: key);
  final DImage image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 32),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: deepPurple,
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(MediaQuery.of(context).size.width, 30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                image.title,
                style: regular,
              ),
              const Divider(
                color: lightPurple,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(image.diaryDate, style: regular),
                  Text(image.hour, style: regular)
                ],
              )
            ],
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: CustomCachedNetworkImage(image: image.url)),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 32),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: deepPurple,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 30),
            ),
          ),
          child: Wrap(
            children: image.tags
                .map((e) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "#$e",
                      style: regular,
                    )))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
