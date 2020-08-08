import 'package:firebase_auth/firebase_auth.dart';
import 'package:better_call_noob/model/user.dart';
import 'package:better_call_noob/services/database.dart';

class AuthService {
  // sign in anon
  // sign in mail and pass
  // reg
  // sign out

  // create user obj based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return (user != null) ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print(user.uid);
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

  Future register_with_email(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;

      Database db = await Database(uid: user.uid);

      await db.update_user_data('Saul Goodman', email, 1);

      return _userFromFirebaseUser(user);
    } catch (e) {
      return null; // null user means invalid user
    }
  }

  Future login_with_email(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;

      return User(uid: user.uid);
    } catch (e) {
      return null; // null user means invalid user
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return await null;
    }
  }
}
