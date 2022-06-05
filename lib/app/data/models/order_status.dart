class OrderStatusModel {

  String name;
  DateTime createAt;

  OrderStatusModel({
    required this.name,
    required this.createAt,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) => OrderStatusModel(
    name: json['status']['status'],
    createAt: DateTime.parse(json['created_at'])
  );
}