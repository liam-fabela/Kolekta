import 'package:flutter/material.dart';

import '../styles/style.dart';

class MenuItemWidget extends StatelessWidget {
  final int id;
  final String title;
  final IconData icon;

  const MenuItemWidget(this.id, this.title, this.icon, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 25),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                   Icon(icon, size: 60, color: const Color.fromRGBO(62, 135, 148, 1),),   
                   Text(title, style: buttonText2(),),
              ],
          ),
           )
      ),
    );
  }
}