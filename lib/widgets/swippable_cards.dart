import 'package:flutter/material.dart';
import '../widgets/character_card_big.dart';
import '../models/character.dart';

class SwippableCards extends StatefulWidget {
  @override
  _SwippableCardsState createState() => _SwippableCardsState();
}

class _SwippableCardsState extends State<SwippableCards> {
  List<Widget> cardList;
  List<Character> _charactersCopy = List.from(characters.reversed);

  void _removeCard(index) {
    setState(() {
      // Get a copy of item to be removed
      Character r = _charactersCopy[index];

      // Remove Card from List
      cardList.removeAt(index);

      // Remove Item from List
      _charactersCopy.removeAt(index);

      // Insert item back into the list so we have a continous stream of data
      _charactersCopy.insert(0, r);

      // Rebuild the card list with the new data
      cardList = _getSwipeCards();
    });
  }

  @override
  void initState() {
    super.initState();

    cardList = _getSwipeCards();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: cardList,
      ),
    );
  }

  List<Widget> _getSwipeCards() {
    double initTop = 15.0;
    double initHor = 20.0;
    double initWidth = 0.9;
    List<Widget> cardList = new List();

    for (var i = 0; i < _charactersCopy.length; i++) {
      // var width = initWidth - double.parse("0.$i");
      var width;
      if (i == _charactersCopy.length) {
        width = 0.9;
      } else if (i == _charactersCopy.length - 1) {
        width = initWidth - 0.05;
      } else if (i == _charactersCopy.length - 2) {
        width = initWidth - 0.1;
      } else if (i == _charactersCopy.length - 3) {
        width = initWidth - 0.15;
      } else {
        width = initWidth - 0.2;
      }
      cardList.add(
        Positioned(
          top: initTop * (i + 1),
          child: Draggable(
            feedback: Material(
              borderRadius: BorderRadius.circular(20.0),
              child: CharacterCardBig(character: _charactersCopy[i]),
            ),
            childWhenDragging: Container(),
            onDragEnd: (drag) {
              _removeCard(i);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: initHor - (3 * (i + 1)),
                vertical: 10.0,
              ),
              child: CharacterCardBig(
                character: _charactersCopy[i],
                width: width,
              ),
            ),
            data: _charactersCopy[i],
          ),
        ),
      );
    }

    final footerBtns = Positioned(
      bottom: 25.0,
      left: 15.0,
      right: 15.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCircularBtn(
                50.0, Icons.star, Colors.amber, Colors.amber[100], 24, 1),
            _buildCircularBtn(
                70.0, Icons.close, Colors.red, Colors.red[100], 34, 2),
            _buildCircularBtn(
                70.0, Icons.favorite, Colors.green, Colors.green[100], 34, 3),
            _buildCircularBtn(
                50.0, Icons.light, Colors.purple, Colors.purple[100], 24, 4),
          ],
        ),
      ),
    );

    cardList.add(footerBtns);

    return cardList;
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
