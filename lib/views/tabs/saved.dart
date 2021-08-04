import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:anime_dating_flutter/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:anime_dating_flutter/widgets/character_card.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);

    final _body = !provider.loading
        ? SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CharacterCard(character: provider.characters[0]),
                    CharacterCard(character: provider.characters[1]),
                    CharacterCard(character: provider.characters[2]),
                    CharacterCard(character: provider.characters[3]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70.0,
                    ),
                    CharacterCard(character: provider.characters[4]),
                    CharacterCard(character: provider.characters[5]),
                    CharacterCard(character: provider.characters[6]),
                    CharacterCard(character: provider.characters[7]),
                  ],
                ),
              ],
            ),
          )
        : Loading();
    return _body;
  }
}
