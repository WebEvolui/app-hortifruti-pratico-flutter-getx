import 'package:app_hortifruti_pratico/app/data/models/city.dart';

class AddressModel {

  int id;
  String street;
  String number;
  String neighborhood;
  String referencePoint;
  String? complement;
  CityModel? city;

  AddressModel({
    required this.id,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.referencePoint,
    this.complement,
    this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json['id'],
    street: json['rua'],
    number: json['numero'],
    neighborhood: json['bairro'],
    referencePoint: json['ponto_referencia'],
    complement: json['complemento'],
    city: json['cidade'] != null
        ? CityModel.fromJson(json['cidade'])
        : null
  );
}