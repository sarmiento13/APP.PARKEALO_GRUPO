import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final int? id;
  final String name;
  final String? description;

  const CategoryWidget({
    super.key,
    this.id,
    required this.name,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: id == 2 ? true : false,
      label: Text(name),
      // side: BorderSide(
      //   color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
      // ),
    );
  }
}
