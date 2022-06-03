class UserLoginRequestModel {

  String email;
  String password;

  UserLoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}