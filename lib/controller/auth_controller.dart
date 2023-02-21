
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool openPassLogin = true.obs;
  TextEditingController edtNohp = TextEditingController();

  changeOpenPassLogin(bool val){
    openPassLogin.value = val;
  }

  validation(){
    if(edtNohp.text == ''){
      Get.snackbar('Title', 'salah woou');
    }
  }
}