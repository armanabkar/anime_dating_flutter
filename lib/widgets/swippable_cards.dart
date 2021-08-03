import 'package:anime_dating_flutter/providers/character.dart';
import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:anime_dating_flutter/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'character_card_big.dart';

class SwippableCards extends StatefulWidget {
  @override
  _SwippableCardsState createState() => _SwippableCardsState();
}

class _SwippableCardsState extends State<SwippableCards> {
  List<SwipeItem> _swipeItems = [];
  MatchEngine _matchEngine;

  @override
  void initState() {
    super.initState();
    _swipeItems.shuffle();
    final fetchedCharacters =
        Provider.of<CharactersDataProvider>(context, listen: false);
    fetchedCharacters.getCharactersData(context);
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    final fetchedCharacters = Provider.of<CharactersDataProvider>(context);

    for (int i = 0; i < fetchedCharacters.characters.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Character(
              id: fetchedCharacters.characters[i].id,
              name: fetchedCharacters.characters[i].name,
              image: fetchedCharacters.characters[i].image,
              age: fetchedCharacters.characters[i].age,
              neighborhood: fetchedCharacters.characters[i].neighborhood),
        ),
      );
    }

    return Container(
      child: !fetchedCharacters.loading
          ? Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: SwipeCards(
                    matchEngine: _matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      return CharacterCardBig(
                          character: _swipeItems[index].content);
                    },
                    onStackFinished: () {},
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Loading()],
            ),
    );
  }

  Widget _buildCircularBtn(double height, IconData icon, Color iconColor,
      Color backgroundColor, double iconSize, int type) {
    double imageSize;

    if (type == 1 || type == 4) {
      imageSize = 25.0;
    } else {
      imageSize = 35.0;
    }

    return MaterialButton(
      color: backgroundColor,
      elevation: 4.0,
      onPressed: () {},
      height: height,
      shape: CircleBorder(),
      child: Container(
        height: 40.0,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
