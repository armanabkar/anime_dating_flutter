import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:anime_dating_flutter/widgets/character_card.dart';
import 'package:provider/provider.dart';

// TODO: add loading

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  void initState() {
    super.initState();

    final fetchedCharacters =
        Provider.of<CharactersDataProvider>(context, listen: false);
    fetchedCharacters.getCharactersData(context);
  }

  @override
  Widget build(BuildContext context) {
    final fetchedCharacters = Provider.of<CharactersDataProvider>(context);

    final _body = !fetchedCharacters.loading
        ? SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CharacterCard(character: fetchedCharacters.characters[0]),
                    CharacterCard(character: fetchedCharacters.characters[1]),
                    CharacterCard(character: fetchedCharacters.characters[2]),
                    CharacterCard(character: fetchedCharacters.characters[3]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70.0,
                    ),
                    CharacterCard(character: fetchedCharacters.characters[4]),
                    CharacterCard(character: fetchedCharacters.characters[5]),
                    CharacterCard(character: fetchedCharacters.characters[6]),
                    CharacterCard(character: fetchedCharacters.characters[7]),
                  ],
                ),
              ],
            ),
          )
        : Container();
    return _body;
  }
}
