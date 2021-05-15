/*import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';





class FirstLaunchPage extends StatefulWidget {
  static const first_launch = "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  @override
  _FirstLaunchPageState createState() => _FirstLaunchPageState();
}

class _FirstLaunchPageState extends State<FirstLaunchPage> {
  GlobalKey _one = GlobalKey();
  BuildContext myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          _isFirstLaunch().then((result){
            if(result)
              ShowCaseWidget.of(myContext).startShowCase([_one]);
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      // onFinish: ,
        builder:
        Builder(builder: (context) {
          myContext = context;
          return Scaffold(
            floatingActionButton: Showcase(
              key: _one,
              title: 'Title',
              description: 'Desc',
              child: InkWell(
                  onTap: () {},
                  child: FloatingActionButton(
                      onPressed: () {
                        print("floating");
                      }
                  )
              ),
            ),
          );
        }));
  }

  Future<bool> _isFirstLaunch() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences.getBool(FirstLaunchPage.first_launch ?? true);

    if(isFirstLaunch)
      sharedPreferences.setBool(FirstLaunchPage.first_launch, false);

    return isFirstLaunch;
  }
}*/