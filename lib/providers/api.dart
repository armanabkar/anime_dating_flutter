import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'character.dart';
import 'dart:convert';

Future<List<Character>> fetchCharacters(context) async {
  final response = await http.get(Uri.parse(K.charactersURL));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Character>((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch characters');
  }
}

Future<List<String>> fetchSuggestions(context) async {
  final response = await http.get(Uri.parse(K.suggestionsURL));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<String>();
    return parsed.toList();
  } else {
    throw Exception('Failed to fetch suggestions');
  }
}
