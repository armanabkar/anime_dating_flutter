import 'package:flutter/material.dart';
import 'views/character_details.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String characterDetailsViewRoute = '/food_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case characterDetailsViewRoute:
      return MaterialPageRoute(
          builder: (_) =>
              CharacterDetailsPage(characterId: settings.arguments));

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
