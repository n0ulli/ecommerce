
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokoonline/model/model_users.dart';

class AuthController extends GetxController{

  RxBool openPassLogin = true.obs;
  RxString userName = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;

  final phoneController = TextEditingController();
  final passController = TextEditingController();

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final confirmpassController = TextEditingController();

  changeOpenPassLogin(bool val){
    openPassLogin.value = val;
  }

  resetTextControl(){
    phoneController.text = "";
    passController.text = "";
    userController.text = "";
    emailController.text = "";
    confirmpassController.text = "";
  }

  Future<bool> getLogin() async {
    try {
      if (phoneController.text.isNotEmpty) {
        if (passController.text.isNotEmpty) {
          List dataUser = await model_users()
              .select_data_login(phoneController.text, passController.text);
          if (dataUser.isNotEmpty) {
            var objData = dataUser[0];
            userName.value = objData['username'].toString();
            firstName.value = objData['first_name'].toString();
            lastName.value = objData['last_name'].toString();
            return true;
          } else {
            Get.snackbar("Login Gagal !", "Username atau password tidak sesuai");
            return false;
          }
        } else {
          Get.snackbar("Peringatan", "Silahkan isi password Anda !");
          return false;
        }
      } else {
        Get.snackbar("Peringatan", "Silahkan isi username Anda !");
        return false;
      }
    } catch (e) {
      Get.snackbar("Peringatan",  e.toString());
      return false;
    }
  }
  
  Future<bool> insertUser() async {
    if (passController.text!=confirmpassController.text) {
      Get.snackbar("Peringatan", "Konfirmasi sandi tidak sama");
      return false;
    }

    if (userController.text.isNotEmpty) {
      var dataReady = await model_users().getUser(userController.text);
      if (dataReady.isNotEmpty) {
        Get.snackbar("Peringatan", "User '${userController.text}' sudah ada");
        return false;
      } else {
        Map obj = {};
        obj['user'] = userController.text;
        obj['email'] = emailController.text;
        obj['phone'] = phoneController.text;
        obj['pass'] = passController.text;
        await model_users().insertUser(obj);
        return true;
      }
    } else {
      Get.snackbar("Peringatan", "Username wajib di isi !");
      return false;
    }
  }
}