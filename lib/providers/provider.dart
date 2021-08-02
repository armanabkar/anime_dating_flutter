import 'package:anime_dating_flutter/providers/api.dart';
import 'package:anime_dating_flutter/providers/character.dart';
import 'package:flutter/material.dart';

class CharactersDataProvider with ChangeNotifier {
  List<Character> characters = [];
  bool loading = false;

  getCharactersData(context) async {
    loading = true;
    final fetchedCharacters = await fetchCharacters(context);
    characters.addAll(fetchedCharacters);
    loading = false;

    notifyListeners();
  }
}
