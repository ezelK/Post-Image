import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {Key? key, required this.image, this.placeholder})
      : super(key: key);

  final String image;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          //borderRadius: BorderRadius.circular(16)
        ),
      ),
      placeholder: (context, url) =>
          placeholder ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Container(
        color: Colors.black,
        child: const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
