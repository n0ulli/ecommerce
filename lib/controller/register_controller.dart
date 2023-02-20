
import 'package:get/get.dart';
import 'package:tokoonline/model/model_users.dart';

class RegisterController extends GetxController{

  Future<bool> insertUser(String user, String email, String phone, String pass) async {
    if (user.isNotEmpty) {
      var dataReady = await model_users().getUser(user);
      if (dataReady.isNotEmpty) {
        // Toast("Peringatan !", "User '${user}' sudah ada", false);
        return false;
      } else {
        Map obj = {};
        obj['user'] = user;
        obj['email'] = email;
        obj['phone'] = phone;
        obj['pass'] = pass;
        await model_users().insertUser(obj);
        return true;
      }
    } else {
      // Toast("Peringatan !", "Username wajib di isi !", false);
      return false;
    }
  }
}