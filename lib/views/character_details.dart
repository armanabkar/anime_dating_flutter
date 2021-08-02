import 'dart:ui';
import 'package:flutter/material.dart';
import '../providers/character.dart';

// TODO: hard codded data
class CharacterDetailsPage extends StatelessWidget {
  final int characterId;
  final Character character = characters[3];

  CharacterDetailsPage({Key key, @required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final cancelBtn = Positioned(
      top: 50.0,
      left: 20.0,
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.5),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
          iconSize: 20.0,
        ),
      ),
    );

    final imageBg = Hero(
      tag: character.id,
      child: Container(
        height: screenHeight * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(character.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

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
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final _neighborhood = Row(
      children: <Widget>[
        Text(
          character.neighborhood,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white60,
          ),
        ),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        Text(
          character.age.toString(),
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white60,
          ),
        ),
      ],
    );

    final _details = Positioned(
      top: screenHeight * 0.66,
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

    final _distance = Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        character.lastSeen,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.blueGrey,
        ),
      ),
    );

    final _description = Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        character.description,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.0,
          color: Colors.blueGrey,
        ),
      ),
    );

    final secondSection = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        height: screenHeight * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_distance, _description],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(height: screenHeight),
                imageBg,
                cancelBtn,
                _details,
                secondSection
              ],
            ),
          ],
        ),
      ),
    );
  }
}
