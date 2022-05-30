class StoreModel {

  int id;
  String name;
  String image;
  bool isOnline;

  StoreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    id: json['id'],
    name: json['nome'],
    image: json['logo'],
    isOnline: json['online'] == 1,
  );
}