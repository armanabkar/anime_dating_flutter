import 'dart:ui';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import '../providers/character.dart';

class CharacterCardBig extends StatelessWidget {
  final Character character;
  final double width;

  const CharacterCardBig({Key key, @required this.character, this.width = 0.9})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _filledCircle = Container(
      height: 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white60,
      ),
    );

    final _name = Text(
      character.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final _neighborhood = Row(
      children: <Widget>[
        Text(
          character.neighborhood,
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white60,
          ),
        ),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        Text(
          character.age.toString(),
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white60,
          ),
        ),
      ],
    );

    final _details = Positioned(
      bottom: 20.0,
      left: 10.0,
      right: 10.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            height: screenHeight * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_name, _neighborhood],
            ),
          ),
        ),
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 4.0,
          child: Container(
            height: screenHeight * 0.675,
            width: screenWidth * width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${K.baseURL}${character.image}"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        _details
      ],
    );
  }
}
