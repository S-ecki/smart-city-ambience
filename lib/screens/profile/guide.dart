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
                "Gleichberechtigung und Anti- Diskriminierungs Guide",
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
                  "  Wir wissen, wie wichtig es ist, dass dies ein Ort ist, an dem Menschen sicher miteinander kommunizieren können. Wir nehmen unsere Aufgabe sehr ernst, die Plattform von jeglichem Missbrauch fernzuhalten. Aus diesem Grund haben wir eine Reihe von Richtlinien erstellt:",
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
                  "  1. Diskriminierung",
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
                  " Wir setzen uns stark für einen diskriminierungsfreien Austausch in unserer App ein: Während der Nutzung unserer App werden keine rassistischen, ethnischen oder anderwertig diskriminierende Beleidigungen toleriert. Wenn einer der genannten Fälle eintritt, muss mit einem dauerhaften Ausschluss von unserer App gerechnet werden.",
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
                  "  2. Privatsphäre",
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
                  "Wir verpflichten uns, die Privatsphäre und die persönlichen Daten von Smart City Ambience zu schützen",
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
                  "  3. Würde",
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
                  "Wir glauben fest daran, dass alle Menschens Würde und Rechte gleich sind. Daher erwarten wir von den Benutzern, dass sie die Würde anderer respektieren und ander User nicht belästigen.",
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
                  "  4. Sicherheit",
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
                  "Aussagen, die Benutzer bedrohen, können andere einschüchtern oder zum Schweigen bringen. Daher sind sie in Smart City Ambience nicht zulässig.",
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
