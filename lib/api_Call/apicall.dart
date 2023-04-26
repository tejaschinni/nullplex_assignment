import 'dart:convert';

import 'package:http/http.dart' as http;

class APICall {
  String url = "http://restsf.nullplex.co.in/api";

  registration(
      String name, String phone, String password, String device) async {
    var response = await http.post(Uri.parse("$url/register"), body: {
      "name": name,
      "mobile": phone,
      "password": password,
      "password_confirmation": password,
      "deviceid": device
    });
    var body = json.decode(response.body);
    return body;
  }

  login(String mobile, String passowrd, String device) async {
    var response = await http.post(Uri.parse("$url/login"),
        body: {"mobile": mobile, "password": passowrd, "deviceid": device});
    var body = json.decode(response.body);
    return body;
  }
}
