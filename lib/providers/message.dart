import 'character.dart';

class Message {
  int id;
  int characterId;
  String characterImage;
  String characterName;
  String neighborhood;
  String content;

  Message(this.id, this.characterId, this.characterImage, this.characterName,
      this.neighborhood, this.content);
}

List<Message> messages = [
  Message(
    1,
    characters[0].id,
    characters[0].image,
    characters[0].name,
    characters[0].neighborhood,
    "I will go back to Gotham and I will fight men Iike this but I will not become an executioner.",
  ),
  Message(
    2,
    characters[1].id,
    characters[1].image,
    characters[1].name,
    characters[1].neighborhood,
    "Someone like you. Someone who'll rattle the cages.",
  ),
  Message(
    3,
    characters[2].id,
    characters[2].image,
    characters[2].name,
    characters[2].neighborhood,
    "Oh, hee-hee, aha. Ha, ooh, hee, ha-ha, ha-ha. And I thought my jokes were bad.",
  ),
  Message(
    4,
    characters[3].id,
    characters[3].image,
    characters[3].name,
    characters[3].neighborhood,
    "Bats frighten me. It's time my enemies shared my dread.",
  )
];
