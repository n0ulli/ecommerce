import 'package:http/http.dart' as http;
import 'dart:convert';

class model_users {
  // String baseUrl = "http://192.168.1.2";
  String baseUrl = "http://172.16.2.57";

  Future<List> select_data_login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/tokool/login.php"),
      body: {"username": username, "password": password},
    );
    var results2 = json.decode(response.body);
    return results2.toList();
  }
  
  Future<List> getUser(String username) async {
    final response = await http.post(
      Uri.parse("$baseUrl/tokool/register.php/getuser"),
      body: {"username": username},
    );
    var results2 = json.decode(response.body);
    return results2.toList();
  }
  
  Future<bool> insertUser(Map dataInsert) async {
    try {
      final response = await http.post(
        Uri.parse(
            "$baseUrl/tokool/register.php/tambahuser"),
        body: {
          "username": dataInsert['user'].toString(),
          "email": dataInsert['email'].toString(),
          "phone": dataInsert['phone'].toString(),
          "password": dataInsert['pass'].toString(),
        },
      );
      if (response.statusCode >= 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
