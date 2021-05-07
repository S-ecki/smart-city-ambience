// TabScreen provides the Scaffold and Bottom Nav Bar for the Main Screen
// It launches the 5 respective screen, which are defined in _pages
// components can be found in /tabs/scaffold

import 'package:flutter/material.dart';
import 'package:smart_city_ambience/tab_screen/chat_screen.dart';
import 'package:smart_city_ambience/tab_screen/event_screen.dart';
import 'package:smart_city_ambience/tab_screen/home_screen.dart';
import 'package:smart_city_ambience/tab_screen/tab_screen_components.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: _selectPage,
      currentIndex: _selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.content_paste_outlined),
          label: "1",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers_outlined),
          label: "2",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_outlined),
          label: "3",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // this keeps track of respective tabs from BottomNav
    // moved into build to get context
    final List<Map<String, Object>> _pages = [
      {
        "page": ChatScreen(),
        "title": "1",
        "buttons": [
          OptionsButton(),
        ],
      },
      {
        "page": HomeScreen(),
        "title": "2",
        "buttons": [
          OptionsButton(),
        ],
      },
      {
        "page": EventScreen(),
        "title": "3",
        "buttons": [
          OptionsButton(),
        ],
      },
    ];
    // this provides the ExpenseList to all descendants
    // also formKey can get accessed with this provider
    return Scaffold(
      // we use the respective title here
      appBar: AppBar(
        actions: _pages[_selectedPageIndex]['buttons'],
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      // loading of appropriate page based on index
      body: _pages[_selectedPageIndex]['page'],
      // the actual tab bar
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
