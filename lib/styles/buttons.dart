import 'package:flutter/material.dart';

final ButtonStyle regularButton = TextButton.styleFrom(
  primary: const Color.fromRGBO(239, 235, 233, 1),
  backgroundColor: const Color.fromARGB(255, 47, 43, 67),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  side: const BorderSide(color: Color.fromARGB(255, 47, 43, 67),),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);
