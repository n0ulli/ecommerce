
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxInt posPage = 0.obs;

  changePage(int val){
    posPage.value = val;
  }
}