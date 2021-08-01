import 'character.dart';

class Message {
  int id = 0;
  int characterId;
  String characterImage;
  String characterName;
  String neighborhood = "Richmond";
  String characterType;
  String date = "a week ago";
  String content;

  Message(this.characterId, this.characterImage, this.characterName,
      this.characterType, this.content);
}

List<Message> messages = [
  Message(
    characters[0].id,
    characters[0].image,
    characters[0].name,
    characters[0].type,
    "Loved it! The staffs are friendly and they have amazing lunch deals.",
  ),
  Message(
    characters[0].id,
    characters[1].image,
    characters[1].name,
    characters[1].type,
    "I come here everyday for my coffee! Love the staffs, they have such sweet hearts ❤️",
  )
];
