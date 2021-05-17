import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verhaltenskodex"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,12,8,22),
          child: Column(
            children: <Widget>[
              // SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Verhaltenskodex für Gleichberechtigung und Anti- Diskriminierung",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Wir wissen, wie wichtig es ist, dass dies ein Ort ist, an dem Menschen sicher miteinander kommunizieren können. Wir nehmen unsere Aufgabe sehr ernst, die Plattform von jeglichem Missbrauch fernzuhalten. Aus diesem Grund haben wir eine Reihe von Richtlinien erstellt:",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "  1. Diskriminierung",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wir setzen uns stark für einen diskriminierungsfreien Austausch in unserer App ein: Während der Nutzung unserer App werden keine rassistischen, ethnischen oder anderwertig diskriminierende Beleidigungen toleriert. Wenn einer der genannten Fälle eintritt, muss mit einem dauerhaften Ausschluss von unserer App gerechnet werden.",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "  2. Privatsphäre",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wir verpflichten uns, die Privatsphäre und die persönlichen Daten von Smart City Ambience zu schützen",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "  3. Würde",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wir glauben fest daran, dass alle Menschens Würde und Rechte gleich sind. Daher erwarten wir von den Benutzern, dass sie die Würde anderer respektieren und ander User nicht belästigen.",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "  4. Sicherheit",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Aussagen, die Benutzer bedrohen, können andere einschüchtern oder zum Schweigen bringen. Daher sind sie in Smart City Ambience nicht zulässig.",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
