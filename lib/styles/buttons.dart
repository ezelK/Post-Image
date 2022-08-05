import 'package:flutter/material.dart';
import 'package:post_image/styles/colors.dart';

final ButtonStyle regularButton = TextButton.styleFrom(
  primary: deepPurple,
  backgroundColor: white,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  side: const BorderSide(color: Color.fromARGB(255, 47, 43, 67),),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
