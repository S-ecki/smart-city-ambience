//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_ambience/screens/home/emotion_input/emotion_input.dart';
import 'package:smart_city_ambience/screens/home/emotion_output/emotion_output_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const first_launch = "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext myContext;
  int selectionInd = 0;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();

/*
Future<bool> _isFirstLaunch() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences.getBool(HomeScreen.first_launch ?? true);

    if(isFirstLaunch)
      sharedPreferences.setBool(HomeScreen.first_launch, false);

    return isFirstLaunch;
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

/*
    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
        /*_isFirstLaunch().then((result){ if (result) */ShowCaseWidget.of(this.context).startShowCase([
        keyOne,
        keyTwo,
        //keyThree,
     ])
          );
        */
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showCaseVisibilityStatus = preferences.getBool("displayShowcase");

      if (showCaseVisibilityStatus == null) {
        preferences.setBool("displayShowcase", false);
        return true;
      }
      return false;
    }

    displayShowcase().then(
      (status) {
        if (status) {
          ShowCaseWidget.of(this.context).startShowCase([keyOne, keyTwo]);
        }
      },
    );

    /*displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print(" showShowcase sucess");
          else
            print("problem occured");
        });
        return true;
      }
      return false;
    }


     displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)
            .startShowCase([keyOne, keyTwo,]);
      }
    });
    */

    return Container(
      // ScrollView (child) takes all the space it needs
      width: double.infinity,
      height: double.infinity,
      // background color
      color: Theme.of(context).backgroundColor,
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: LayoutBuilder(
            builder: (context, dimens) {
              return Column(
                children: [
                  CostumShowCase(
                    globalKey: keyOne,
                    description: ' Tell us your feelings here: ',
                    child: Container(
                      height: dimens.maxHeight * 0.30,
                      width: dimens.maxWidth,
                      child: EmotionInput(),
                    ),
                  ),
                  CostumShowCase(
                    globalKey: keyTwo,
                    description: ' Statistics about emotions:  ',
                    child: SizedBox(
                      height: dimens.maxHeight * 0.70,
                      width: dimens.maxWidth,
                      child: EmotionOutputTabs(),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
/*
 Future<bool> _isFirstLaunch() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences.getBool(HomeScreen.first_launch ?? true);

    if(isFirstLaunch)
      sharedPreferences.setBool(HomeScreen.first_launch, false);

    return isFirstLaunch;
  }*/

}

class CostumShowCase extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;

  const CostumShowCase({
    @required this.child,
    @required this.description,
    @required this.globalKey,
  });

  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Colors.green[300],
        contentPadding: EdgeInsets.all(12),
        description: description,
        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
        child: child,
      );
}
