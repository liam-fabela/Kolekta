import 'package:flutter/material.dart';

class GarbageHomePage extends StatefulWidget {
  const GarbageHomePage({ Key? key }) : super(key: key);

  @override
  _GarbageHomePageState createState() => _GarbageHomePageState();
}

class _GarbageHomePageState extends State<GarbageHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [
          Text(
              "KOLEKTA | Garbage Collector",
              style: TextStyle(
                color: Color.fromRGBO(62, 135, 148, 1),
                fontSize: 50,
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}