import 'package:flutter/material.dart';

class SingleComment extends StatelessWidget {
  const SingleComment({this.userName, this.comment});

  final String userName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
        ],
      ),
    );
  }
}
