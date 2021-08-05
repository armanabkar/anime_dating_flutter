import 'package:anime_dating_flutter/router.dart';
import 'package:anime_dating_flutter/utils/colors.dart';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:anime_dating_flutter/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  K.appName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                AuthField(placeholder: "Enter your Name"),
                SizedBox(height: 10),
                AuthField(placeholder: "Enter your Age"),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, homeViewRoute),
                  child: Text("Let's Go!"),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(18),
                    primary: Colors.white,
                    backgroundColor: primaryColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "*Currently only available in the US.",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
