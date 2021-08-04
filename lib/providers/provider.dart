import 'package:anime_dating_flutter/providers/api.dart';
import 'package:anime_dating_flutter/providers/character.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<Character> characters = [];
  List<String> suggestions = [];
  bool loading = false;

  getCharactersData(context) async {
    loading = true;
    final fetchedCharacters = await fetchCharacters(context);
    characters.addAll(fetchedCharacters);
    loading = false;

    notifyListeners();
  }

  getSuggestionData(context) async {
    final fetchedSuggestions = await fetchSuggestions(context);
    suggestions.addAll(fetchedSuggestions);

    notifyListeners();
  }
}
