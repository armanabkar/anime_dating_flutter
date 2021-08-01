import 'resturant.dart';

class Review {
  int id = 0;
  int resturantId;
  String resturantPhoto;
  String resturantName;
  String location = "Richmond";
  String resturantType;
  String date = "a week ago";
  String content;

  Review(this.resturantId, this.resturantPhoto, this.resturantName,
      this.resturantType, this.content);
}

List<Review> reviews = [
  Review(
    resturants[0].id,
    resturants[0].photo,
    resturants[0].name,
    resturants[0].type,
    "Loved it! The staffs are friendly and they have amazing lunch deals.",
  ),
  Review(
    resturants[0].id,
    resturants[1].photo,
    resturants[1].name,
    resturants[1].type,
    "I come here everyday for my coffee! Love the staffs, they have such sweet hearts ❤️",
  )
];
