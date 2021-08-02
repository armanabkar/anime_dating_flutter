import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CharactersDataProvider>(
    create: (_) => CharactersDataProvider(),
  ),
];
