import '../utils/utils.dart';

class Character {
  int id;
  String name;
  int age = 20;
  String neighborhood = "Richmond";
  String image;
  String type;
  String date = "a week ago";
  String distance = "5.2km away";
  String description =
      "We provide you with food that is fresh, fun and affordable in a relaxed atmosphere where the whole family can enjoy.";

  Character(this.id, this.image, this.name, this.type);
}

List<Character> characters = [
  Character(1, AvailableImages.burger, "The Beer & Burger Bar", "Burger Bar"),
  Character(2, AvailableImages.gelato, "Gellato Messina", "Mexican"),
  Character(3, AvailableImages.tacos, "Taco Jill", "Mexican"),
  Character(4, AvailableImages.cafe, "The Industrial Cafe", "Cafe"),
];
