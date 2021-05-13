import 'package:flutter/material.dart';

class AuthHeaderContainer extends StatelessWidget {
  const AuthHeaderContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: Icon(
        Icons.supervisor_account_rounded,
        color: Colors.white,
        size: 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
