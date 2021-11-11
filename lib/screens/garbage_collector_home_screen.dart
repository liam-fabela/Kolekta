import 'package:flutter/material.dart';

import '../pages/garbage_home_page.dart';
import '../pages/garbage_notification_page.dart';
import '../widgets/side_drawer.dart';

class GarbageHomeScreen extends StatefulWidget {
  const GarbageHomeScreen({ Key? key }) : super(key: key);

  @override
  _GarbageHomeScreenState createState() => _GarbageHomeScreenState();
}

class _GarbageHomeScreenState extends State<GarbageHomeScreen> {
  final _pages = [
    const GarbageHomePage(),
    const GarbageNotificationtPage(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color.fromRGBO(62, 135, 148, 1)),
      ),
      body: _pages[_selectedPageIndex],
       bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          backgroundColor:  const Color.fromRGBO(62, 135, 148, 1),//Theme.of(context).primaryColor,
          unselectedItemColor: const Color.fromRGBO(49, 204, 183,1),
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
             BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ]),
    
    );
  }
}