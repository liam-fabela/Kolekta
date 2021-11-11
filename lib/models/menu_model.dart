import 'package:flutter/material.dart';

class MenuItems {
  final int id;
  final String title;
  final IconData icon;

  const MenuItems({
    required this.id,
    required this.title,
    required this.icon,
  });
}


const menuItems = [
  MenuItems(id: 1, title: 'Bin Status', icon: Icons.delete),
  MenuItems(id: 2, title: 'Map', icon: Icons.map),
  MenuItems(id: 3, title: 'Schedule', icon: Icons.schedule),
  MenuItems(id: 4, title: 'Message', icon: Icons.mail),
];