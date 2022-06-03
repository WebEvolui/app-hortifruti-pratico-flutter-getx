class ShippingByCityModel {

  int id;
  String name;
  num cost;

  ShippingByCityModel({
    required this.id,
    required this.name,
    required this.cost,
  });

  factory ShippingByCityModel.fromJson(Map<String, dynamic> json) => ShippingByCityModel(
    id: json['id'],
    name: json['nome'],
    cost: json['custo_entrega'],
  );
}