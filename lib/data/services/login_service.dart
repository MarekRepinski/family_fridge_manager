import 'package:family_fridge_manager/data/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginService extends GetConnect {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthenticationManager _manager = Get.find();
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<User?> createUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      return result.user;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  Future<User?> signInUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      return result.user;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
      _manager.logOut();
    } catch (e) {
      print(e.toString());
    }
  }
}


