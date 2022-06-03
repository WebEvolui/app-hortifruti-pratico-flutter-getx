class CityModel {

  int id;
  String name;
  String uf;

  CityModel({
    required this.id,
    required this.name,
    required this.uf,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json['id'],
    name: json['nome'],
    uf: json['estado']['uf']
  );
}