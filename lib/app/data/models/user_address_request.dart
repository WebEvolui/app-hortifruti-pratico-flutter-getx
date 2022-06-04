class UserAddressRequestModel {

  String street;
  String number;
  String neighborhood;
  String referencePoint;
  String? complement;
  int cityId;

  UserAddressRequestModel({
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.referencePoint,
    this.complement,
    required this.cityId,
  });

  Map<String, dynamic> toJson() => {
    'rua': street,
    'numero': number,
    'bairro': neighborhood,
    'ponto_referencia': referencePoint,
    'cidade_id': cityId,
    if (complement!.isNotEmpty)
      'complemento': complement
  };
}