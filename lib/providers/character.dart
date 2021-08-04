class Character {
  int id;
  String name;
  int age;
  String neighborhood;
  String image;
  String lastSeen = "Last seen: 3h ago";
  String description =
      "Laborum sit irure dolore quis reprehenderit culpa consequat ea.Laborum sit irure dolore quis reprehenderit culpa consequat ea.";

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
