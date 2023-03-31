class User {
  String id;
  String firstName;
  String surname;
  String phoneNumber;
  String email;
  String password;
  String code;

  User(
      {required this.id,
      required this.firstName,
      required this.surname,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.code});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['firstName'],
        surname: json['surname'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        password: json['password'],
        code: json['code']);
  }

  Map<String, dynamic> toJson() => {
        id: 'id',
        firstName: 'firstName',
        surname: 'surname',
        phoneNumber: 'phoneNumber',
        email: 'email',
        password: 'password',
        code: 'code'
      };
}
