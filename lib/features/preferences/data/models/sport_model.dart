import 'package:flutter/material.dart';

class Sport {
  final int id;
  final String name;
  final IconData iconData;

  Sport({
    required this.id,
    required this.name,
    required this.iconData,
  });
}

List<Sport> sports = [
  Sport(id: 1, name: 'Soccer', iconData: Icons.sports_soccer),
  Sport(id: 2, name: 'Baseball', iconData: Icons.sports_baseball),
  Sport(id: 3, name: 'Basketball', iconData: Icons.sports_basketball),
];
