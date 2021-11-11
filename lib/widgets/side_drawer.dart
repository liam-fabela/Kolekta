import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: true,
      bottom: true,
      right: false,
      child: Drawer(
        child: Container(
          color: const Color.fromRGBO(62, 135, 148, 1),
          ),
        
        ),
    );
  }
}