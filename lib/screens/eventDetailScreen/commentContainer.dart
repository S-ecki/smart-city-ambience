import 'package:flutter/material.dart';

/**
 * 
 */
class CommentContainer extends StatelessWidget {
  CommentContainer({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
