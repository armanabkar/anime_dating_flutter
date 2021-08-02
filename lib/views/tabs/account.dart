import 'package:anime_dating_flutter/providers/character.dart';
import 'package:anime_dating_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/message_card.dart';
import '../../providers/message.dart';

// TODO: hard codded data

class AccountPage extends StatelessWidget {
  final Character character = characters[3];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final userImage = Positioned(
      top: deviceHeight * 0.05,
      left: deviceWidth * 0.28,
      child: Material(
        elevation: 4.0,
        shape: CircleBorder(),
        child: Container(
          height: 180.0,
          width: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(character.image),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: primaryColor,
              width: 5.0,
            ),
          ),
        ),
      ),
    );

    final circle1 = Positioned(
      top: deviceHeight * 0.09,
      right: deviceWidth * 0.18,
      child: _buildGradientCircle(90.0),
    );
    final circle2 = Positioned(
      top: deviceHeight * 0.17,
      left: deviceWidth * 0.13,
      child: _buildGradientCircle(70.0),
    );
    final circle3 = Positioned(
      top: deviceHeight * 0.29,
      right: deviceWidth * 0.33,
      child: _buildGradientCircle(40.0),
    );

    final userNameAndNeighborhood = Positioned(
      top: deviceHeight * 0.32,
      left: 0,
      right: 0,
      child: Column(
        children: <Widget>[
          Text(
            character.name,
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
          ),
          Text(
            character.neighborhood,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

    final userImageSection = Container(
      height: deviceHeight * 0.425,
      child: Stack(
        children: <Widget>[
          circle1,
          circle2,
          circle3,
          userImage,
          userNameAndNeighborhood
        ],
      ),
    );

    final br = Radius.circular(30.0);

    final messageList =
        messages.map((message) => MessageCard(message: message)).toList();

    final chatSection = Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: br, topLeft: br),
      ),
      constraints: BoxConstraints(minHeight: deviceHeight / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Your Recent Messages",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: messageList,
          )
        ],
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[userImageSection, chatSection],
        ),
      ),
    );
  }

  Widget _buildGradientCircle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFECF9E8),
            Color(0xFFE6F6EF),
          ],
        ),
      ),
    );
  }
}
