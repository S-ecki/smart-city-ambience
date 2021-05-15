import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_ambience/Authentification/Service/AuthService.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';

/**
 * 
 */
class GoogleSocialLoginButton extends StatelessWidget {
  const GoogleSocialLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () async {
          FireBaseSignInResponse response =
              await context.read<AuthServcice>().signInWithGoogle();
          if (response == FireBaseSignInResponse.Success) {
            Navigator.of(context).pushNamed(SmortRoutes.navBarScreen);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Image(
                image: AssetImage("assets/images/googleLogo.png"),
                height: 20,
                width: 20,
              ),
            ),
            Text(
              "Login With Google",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
