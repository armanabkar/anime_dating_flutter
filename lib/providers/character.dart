import '../utils/constants.dart';

class Character {
  int id;
  String name;
  int age;
  String neighborhood;
  String image;
  String lastSeen = "Last seen: 3h ago";
  String description =
      "Laborum sit irure dolore quis reprehenderit culpa consequat ea.Laborum sit irure dolore quis reprehenderit culpa consequat ea.Laborum sit irure dolore quis reprehenderit culpa consequat ea.";

  Character({this.id, this.image, this.name, this.neighborhood, this.age});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      neighborhood: json['neighborhood'],
      image: json['image'],
    );
  }
}

List<Character> characters = [
  Character(
      id: 1,
      image: K.KushinaUzumakiStaticImage,
      name: "Kushina Uzumaki",
      neighborhood: "Hidden Leaf Village",
      age: 24),
  Character(
      id: 2,
      image: K.RyukoMatoiStaticImage,
      name: "Ryuko Matoi",
      neighborhood: "Honnōji Academy",
      age: 17),
  Character(
      id: 3,
      image: K.MikasaAckermanStaticImage,
      name: "Mikasa Ackerman",
      neighborhood: "Shiganshina District",
      age: 19),
  Character(
      id: 4,
      image: K.SakuraHarunoStaticImage,
      name: "Sakura Haruno",
      neighborhood: "Hidden Leaf Village",
      age: 33),
];
