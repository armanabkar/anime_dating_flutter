import '../utils/utils.dart';

class Resturant {
  int id;
  String photo;
  String name;
  String location = "Richmond";
  String type;
  String date = "a week ago";
  String distance = "5.2km away";
  String description =
      "We provide you with food that is fresh, fun and affordable in a relaxed atmosphere where the whole family can enjoy.";

  Resturant(this.id, this.photo, this.name, this.type);
}

List<Resturant> resturants = [
  Resturant(1, AvailableImages.burger, "The Beer & Burger Bar", "Burger Bar"),
  Resturant(2, AvailableImages.gelato, "Gellato Messina", "Mexican"),
  Resturant(3, AvailableImages.tacos, "Taco Jill", "Mexican"),
  Resturant(4, AvailableImages.cafe, "The Industrial Cafe", "Cafe"),
];
