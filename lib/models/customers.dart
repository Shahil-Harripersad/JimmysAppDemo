class Customers {
  final String email;
  final String password;
  final int points;

  const Customers(
      {required this.email, required this.password, required this.points});

  //Making customer very accessible using firebase
  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password, 'points': points};
}
