// TabScreen provides the Scaffold and Bottom Nav Bar for the Main Screen
// It launches the 3 respective screen, which are defined in _pages

import 'package:flutter/material.dart';
import 'package:smart_city_ambience/navbar/navbar_screen_components.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/screens/chats/forum_screen.dart';
import 'package:smart_city_ambience/screens/events/event_screen.dart';
import 'package:smart_city_ambience/screens/home/home_screen.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int selectionInd = 0;
  //final keyOne = GlobalKey();
  //final keyTwo = GlobalKey();
  /*final keyThree = GlobalKey();
  final keyFour = GlobalKey();
  final keyFive = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(this.context)
          .startShowCase([keyOne, keyTwo,]),
    );
  }*/

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
/*
   SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print("Sucess");
          else
            print("Problem occured");
        });
        return true;
      }
      return false;
    }


     displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)
            .startShowCase([keyOne ,keyTwo,]);
      }
    });*/

    /*SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showCaseVisibilityStatus = preferences.getBool("displayShowcase");

      if (showCaseVisibilityStatus == null) {
        preferences.setBool("displayShowcase", false);
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(this.context).startShowCase([keyThree, keyFour]);
      }
    });*/

    return BottomNavigationBar(
      onTap: _selectPage,
      currentIndex: _selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: /*Showcase(
            key:/keyOne,
            description: "Events",
            child:*/ Icon(Icons.emoji_symbols),
          //),
          label: "Events",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: /*Showcase(
            key: keyTwo,
            description: "Chats",
            child: */Icon(Icons.chat),
          //),
          label: "Chats",
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
        "page": ShowCaseWidget(
            builder: Builder(
              builder: (context) =>HomeScreen(),)),
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
          icon: /*CostumShowCase(
            globalKey: keyFive,
            description: "Edit your Profile",
            child:*/ Icon(Icons.account_circle),
          //),
          onPressed: () {
            Navigator.of(context).pushNamed(SmortRoutes.profileScreen);
          },
        ),
        actions: _pages[_selectedPageIndex]['buttons'],
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      // the actual tab bar
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButton: _pages[_selectedPageIndex]['fab'],
      resizeToAvoidBottomInset: false,
    );
  }
}
