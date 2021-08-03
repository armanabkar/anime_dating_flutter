import 'package:anime_dating_flutter/providers/character.dart';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:anime_dating_flutter/router.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final Character character;

  const MessageCard({Key key, @required this.character, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, characterDetailsViewRoute,
            arguments: character.id);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        height: 55.0,
        width: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage("${K.baseURL}${character.image}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final _name = InkWell(
      onTap: () {
        Navigator.pushNamed(context, characterDetailsViewRoute,
            arguments: character.id);
      },
      child: Text(
        character.name,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final _content = Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        message.replaceRange(49, message.length, '...'),
        style: TextStyle(),
      ),
    );

    final _hr = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 0.8,
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.grey.withOpacity(0.4),
    );

    final details = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_name, _content, _hr],
      ),
    );

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[img, details],
      ),
    );
  }
}
