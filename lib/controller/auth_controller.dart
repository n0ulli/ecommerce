
import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool openPassLogin = true.obs;

  changeOpenPassLogin(bool val){
    openPassLogin.value = val;
  }
}