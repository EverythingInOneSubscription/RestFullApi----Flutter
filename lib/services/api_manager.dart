import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/strings.dart';
import '../models/apimodel.dart';

// ignore: camel_case_types
class API {
  Future<Resapi> getdata() async {
    var client = http.Client();
    var resModel;
    var apil;

    try {
      var response = await client.post(
        ApiUrl.url,
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode(
          <String, dynamic>{"name": "morpheus", "job": "leader"},
        ),
      );
//in my case its status code is 201
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        resModel = Resapi.fromJson(jsonMap);
      }
    } catch (Exception) {
      return resModel;
    }

    return resModel;
  }
}
