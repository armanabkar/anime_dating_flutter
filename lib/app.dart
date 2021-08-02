import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'theme.dart';
import 'utils/constants.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: K.appName,
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: router.homeViewRoute,
    );
  }
}
