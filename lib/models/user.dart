class User {
  User({
    this.password,
    this.confirmPassword,
    this.firstName,
    this.lastName,
    this.email,
  });

  final String? password;
  final String? confirmPassword;
  final String? firstName;
  final String? lastName;
  final String? email;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      password: json["password"],
      confirmPassword: json["confirmPassword"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "password": password,
        "confirmPassword": confirmPassword,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
