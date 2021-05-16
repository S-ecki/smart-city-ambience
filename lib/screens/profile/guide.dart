import 'package:flutter/material.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Guideline"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Equality and Non-Discrimination Guide",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 25),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "  We know how important it is for this to be a place where people can safely communicate with one another. We also take our task very seriously to keep our platform away from any kind of abuse. For this reason we have created a number of guidelines:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )),
            SizedBox(height: 50),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "  1. Discrimination",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                  " We are strongly committed to a non-discriminatory exchange in our app: No racist, ethnic or other discriminatory insults will be tolerated while using our app. If one of the mentioned  cases occurs, permanent exclusion from our app must be expected.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 50),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "  2. Privacy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                  "We are committed to protect privacy and personal information on Smart City Ambience",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 50),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "  3. Dignity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                  "We strongly believe that all people are equal in dignity and rights. Therefore, we expect users to respect the dignity of others and not to harass others.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 50),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "  4. Safeness",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                )),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                  "Statements that threaten users have the potential to intimidate or silence others. Therefore, they are not allowed on Smart City Ambience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  )),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamed(SmortRoutes.loginScreen);
        },
      ),
    );
  }
}
