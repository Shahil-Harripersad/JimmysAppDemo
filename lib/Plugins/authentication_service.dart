import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../models/customers.dart';
import '../utils/show_snack_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  DatabaseReference _ref = FirebaseDatabase.instance.ref().child('Customers');

  //Adding customer to the database
  void saveCustomer(email, password) {
    int points = 0;
    // creating a customer object using the customer model
    Customers customer =
        Customers(email: email, password: password, points: points);

    _ref.push().set(customer.toJson()); //the actual inserting of a new record
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showSnackBar(context, 'Invalid email address');
      } else if (e.code == 'user-not-found') {
        showSnackBar(context, 'You do not have an account. Try signing up!');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'The password is invalid');
      } else {
        showSnackBar(context, e.message!);
      }
      return e.message;
    }
  }

  Future<String?> signUp(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      saveCustomer(email, password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      if (e.code == 'invalid-email') {
        showSnackBar(context, 'The email address is not valid');
      } else {
        showSnackBar(context, e.message!);
      }
      return e.message;
    }
  }
}
