
import 'package:get/get.dart';
import 'package:tokoonline/model/model_users.dart';

class LoginController extends GetxController{
  RxBool showPass = false.obs;
  RxString userName = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  
  Future<bool> getLogin(String user, String pass) async {
    try {
      if (user.isNotEmpty) {
        if (pass.isNotEmpty) {
          List dataUser = await model_users()
              .select_data_login(user, pass);
          if (dataUser.isNotEmpty) {
            var objData = dataUser[0];
            userName.value = objData['username'].toString();
            firstName.value = objData['first_name'].toString();
            lastName.value = objData['last_name'].toString();
            return true;
          } else {
            // Toast("Login Gagal !", "Username atau password tidak sesuai", false);
            return false;
          }
        } else {
          // Toast("Peringatan", "Silahkan isi password Anda !", false);
          return false;
        }
      } else {
        // Toast("Peringatan", "Silahkan isi username Anda !", false);
        return false;
      }
    } catch (e) {
      // Toast("Peringatan", e.toString(), false);
      return false;
    }
  }
}