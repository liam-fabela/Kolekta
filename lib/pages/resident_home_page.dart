import 'package:flutter/material.dart';

import '../models/menu_model.dart';
import '../widgets/menu_item.dart';

class ResidentHomePage extends StatefulWidget {
  const ResidentHomePage({Key? key}) : super(key: key);

  @override
  _ResidentHomePageState createState() => _ResidentHomePageState();
}

class _ResidentHomePageState extends State<ResidentHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      top: true,
      bottom: true,
      right: false,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
              "KOLEKTA | Resident",
              style: TextStyle(
                color: Color.fromRGBO(62, 135, 148, 1),
                fontSize: 50,
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView(
                padding: const EdgeInsets.all(10),
                children: menuItems
                    .map((menuData) => MenuItemWidget(
                        menuData.id, menuData.title, menuData.icon))
                    .toList(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
