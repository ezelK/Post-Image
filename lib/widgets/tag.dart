import 'package:flutter/material.dart';

class Chipp extends StatelessWidget {
  const Chipp({
    Key? key,
    required this.label,
    required this.onDeleted,
    required this.index,
  }) : super(key: key);

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 16.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
