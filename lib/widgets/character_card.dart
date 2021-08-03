import 'dart:ui';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import '../router.dart';
import '../providers/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key key, @required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _name = Text(
      character.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final _neighborhood = Row(
      children: <Widget>[
        Text(
          character.neighborhood,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white60,
          ),
        )
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
            height: screenHeight * .1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_name, _neighborhood],
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          characterDetailsViewRoute,
          arguments: character.id,
        );
      },
      child: Stack(
        children: <Widget>[
          Hero(
            tag: character.id,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              height: screenHeight * 0.35,
              width: screenWidth * 0.45,
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
      ),
    );
  }
}
