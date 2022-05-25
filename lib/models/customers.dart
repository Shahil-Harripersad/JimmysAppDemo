class Customers {
  final String email;
  final String password;

  const Customers({required this.email, required this.password});

  //Making customer very accessible using firebase
  Map<String, String> toJson() => {'email': email, 'password': password};
}
