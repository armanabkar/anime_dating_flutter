import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:anime_dating_flutter/utils/colors.dart';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:anime_dating_flutter/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/message_card.dart';
import 'dart:math';

class AccountPage extends StatelessWidget {
  final Random random = new Random();
  static List<String> messages = [
    "I will go back to Gotham and I will fight men Iike this but I will not become an executioner.",
    "Someone like you. Someone who'll rattle the cages.",
    "Oh, hee-hee, aha. Ha, ooh, hee, ha-ha, ha-ha. And I thought my jokes were bad.",
    "Bats frighten me. It's time my enemies shared my dread.",
    "It's not who I am underneath but what I do that defines me.",
    "You have nothing, nothing to threaten me with. Nothing to do with all your strength.",
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    final userImage = Container(
      child: Material(
        elevation: 4.0,
        shape: CircleBorder(),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  NetworkImage("${K.baseURL}${provider.characters[20].image}"),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: appBarColor,
              width: 5.0,
            ),
          ),
        ),
      ),
    );

    final userNameAndNeighborhood = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            provider.characters[20].name,
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
          ),
          Text(
            provider.characters[20].neighborhood,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 22.0,
            ),
          ),
        ],
      ),
    );

    final userImageSection = Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userImage,
          SizedBox(height: 22.5),
          userNameAndNeighborhood,
        ],
      ),
    );

    final br = Radius.circular(30.0);

    final messageList = messages
        .map(
          (message) => MessageCard(
            message: message,
            character: provider
                .characters[random.nextInt(provider.characters.length - 1) + 1],
          ),
        )
        .toList();

    final messagesSection = Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: br, topLeft: br),
      ),
      constraints: BoxConstraints(minHeight: deviceHeight * 0.4),
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

    return !provider.loading
        ? SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[userImageSection, messagesSection],
              ),
            ),
          )
        : Loading();
  }
}
