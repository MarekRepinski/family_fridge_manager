import 'package:family_fridge_manager/data/services/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CasheManager {
  final isLogged = false.obs;

  void logOut(){
    isLogged.value = false;
    removeToken();
  }

  void logIn(String? token, String type) async {
    isLogged.value = true;
    await saveToken(token);
  }

  String? checkLoginStatus() {
    final token = getToken();
    if (token != null){
      isLogged.value = true;
      return token;
    }
    return null;
  }
}