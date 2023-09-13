class User {
  String id;
  String firstName;
  String surname;
  String phoneNumber;
  String email;
  String password;

  User(
      {required this.id,
      required this.firstName,
      required this.surname,
      required this.phoneNumber,
      required this.email,
      required this.password,
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        firstName: json['first_name'],
        surname: json['surname'],
        phoneNumber: json['phone_number'],
        email: json['email'],
        password: json['password']
    );
  }

  Map<String, dynamic> toJson() => {
        id: '_id',
        firstName: 'first_name',
        surname: 'surname',
        phoneNumber: 'phone_number',
        email: 'email',
        password: 'password',
      };
}
