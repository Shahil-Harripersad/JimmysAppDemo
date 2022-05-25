class Employee {
  final String fName;
  final String sName;
  final bool admin;
  final String empPassword;

  const Employee(
      {required this.fName,
      required this.sName,
      required this.admin,
      required this.empPassword});

  Map<String, dynamic> toJson() => {
        'fName': fName,
        'sName': sName,
        'admin': admin,
        'empPassword': empPassword
      };
}
