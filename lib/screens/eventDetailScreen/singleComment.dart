import 'package:flutter/material.dart';

class SingleComment extends StatelessWidget {
  const SingleComment({this.userName, this.comment});

  final String userName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.person,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: userName + ": ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: comment,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "report",
                child: Text('Kommentar melden'),
              ),
            ],
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Kommentar wurde gemeldet."),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
