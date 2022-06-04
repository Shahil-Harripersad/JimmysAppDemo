import 'package:firebase_database/firebase_database.dart';
import 'package:jimmys_app_demo/models/employess.dart';

class Data {
  Data() {
    DatabaseReference anyData = FirebaseDatabase.instance.ref();

    final employees = anyData.child('Employees');
    final menuItem = anyData.child('MenuItem');

    void addReward(String fName, String sName, bool admin, String empPassword) {
      final employees = anyData.child('Reward');
      employees.push().set(Employee(
          fName: fName, sName: sName, admin: admin, empPassword: empPassword));
    }
  }
}
