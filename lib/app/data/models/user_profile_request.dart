class UserProfileRequestModel {

  String name;
  String email;
  String phone;
  String? password;

  UserProfileRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'nome': name,
    'email': email,
    'telefone': phone,
    if (password != null && password!.isNotEmpty)
      'password': password,
  };
}