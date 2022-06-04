class Customers {
  final String uid;
  final String email;
  final String password;
  final int points;
//
  const Customers(
      {required this.uid,
      required this.email,
      required this.password,
      required this.points});

  //Making customer very accessible using firebase
  Map<String, dynamic> toJson() =>
      {'uid': uid, 'email': email, 'password': password, 'points': points};
}
