import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoryTabs({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Politics', 'Sport', 'Education'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories.map((category) {
        return GestureDetector(
          onTap: () => onCategorySelected(category.toLowerCase()),
          child: Chip(label: Text(category)),
        );
      }).toList(),
    );
  }
}
