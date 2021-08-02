import 'package:flutter/material.dart';
import 'package:anime_dating_flutter/router.dart';
import '../providers/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({Key key, @required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _filledCircle = Container(
      height: 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.6),
      ),
    );

    final img = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, characterDetailsViewRoute,
            arguments: message.characterId);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        height: 55.0,
        width: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(
              message.characterImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final _name = InkWell(
      onTap: () {
        Navigator.pushNamed(context, characterDetailsViewRoute,
            arguments: message.characterId);
      },
      child: Text(
        message.characterName,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final _content = Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        message.content.replaceRange(49, message.content.length, '...'),
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
