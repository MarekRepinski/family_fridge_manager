import 'package:family_fridge_manager/data/services/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CasheManager {
  final isLoggedIn = false.obs;

  void logOut(){
    isLoggedIn.value = false;
    removeToken();
  }

  void logIn(String? token) async {
    isLoggedIn.value = true;
    await saveToken(token);
  }

  String? checkLoginStatus() {
    final token = getToken();
    if (token != null){
      isLoggedIn.value = true;
      return token;
    }
    return null;
  }
}