import 'package:flutter/material.dart';
import 'package:anime_dating_flutter/widgets/character_card.dart';
import '../../models/character.dart';

class SavedPage extends StatelessWidget {
  bool isOddNumber(int number) {
    return number % 2 == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final _body = SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              CharacterCard(character: characters[0]),
              CharacterCard(character: characters[1]),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              CharacterCard(character: characters[2]),
              CharacterCard(character: characters[3]),
            ],
          ),
        ],
      ),
    );

    return _body;
  }

  Widget buildList() {
    List<Character> leftSide = [];
    List<Character> rightSide = [];
    characters.forEach((character) {
      int index = characters.indexOf(character);
      bool isOddNum = isOddNumber(index);

      isOddNum ? rightSide.add(character) : leftSide.add(character);
    });

    return Row(
      children: <Widget>[
        Column(
          children:
              leftSide.map((res) => CharacterCard(character: res)).toList(),
        ),
        Column(
          children: rightSide.map((res) {
            return Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                CharacterCard(character: res),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
