// TabScreen provides the Scaffold and Bottom Nav Bar for the Main Screen
// It launches the 3 respective screen, which are defined in _pages

import 'package:flutter/material.dart';
import 'package:smart_city_ambience/navbar/navbar_screen_components.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/forum_screen.dart';
import 'package:smart_city_ambience/screens/events/event_screen.dart';
import 'package:smart_city_ambience/screens/home/home_screen.dart';

class NavbarScreen extends StatefulWidget {
  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedPageIndex = 1;

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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: "News",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "Forum",
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
        "page": EventScreen(),
        "title": "News",
        "buttons": [
          OptionsButton(),
        ],
        "fab": null,
      },
      {
        "page": HomeScreen(),
        "title": "Smart City Ambience",
        "buttons": [
          OptionsButton(),
        ],
        "fab": null,
      },
      {
        "page": ForumScreen(),
        "title": "Forum",
        "buttons": [
          OptionsButton(),
        ],
        "fab": ForumFAB(),
      },
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).pushNamed(SmortRoutes.profileScreen);
            },
          ),
          actions: _pages[_selectedPageIndex]['buttons'],
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        // loading of appropriate page based on index
        body: _pages[_selectedPageIndex]['page'],
        // the actual tab bar
        bottomNavigationBar: buildBottomNavigationBar(context),
        floatingActionButton: _pages[_selectedPageIndex]['fab']);
  }
}
