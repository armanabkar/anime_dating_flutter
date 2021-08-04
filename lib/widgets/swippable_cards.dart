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
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);

    for (int i = 0; i < provider.characters.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Character(
              id: provider.characters[i].id,
              name: provider.characters[i].name,
              image: provider.characters[i].image,
              age: provider.characters[i].age,
              neighborhood: provider.characters[i].neighborhood),
        ),
      );
    }

    return Container(
      child: !provider.loading
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
          : Loading(),
    );
  }
}
