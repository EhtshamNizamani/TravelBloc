class DataModel {
  String name;
  String img;
  int? price;
  int? people;
  int? stars;
  String location;
  String description;

  DataModel({
    required this.description,
    required this.img,
    required this.location,
    required this.name,
    required this.people,
    required this.price,
    required this.stars,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        description: json['description'],
        img: json['img'],
        location: json['location'],
        name: json['name'],
        people: json['people'],
        price: json['price'],
        stars: json['stars']);
  }
}
