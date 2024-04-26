import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginExample extends StatelessWidget {
  LoginExample({super.key});

  final dio = Dio();

  final String baseUrl =
      "https://keyclock.cluster-dev.ioasys.com.br/realms/camp-ioasys-2024/protocol/openid-connect/token";

  final Map<String, dynamic> userModelJson = {
    "clientId": "camp-ioasys-2024",
    "clientSecret": "BiKzHxr9ZoZRDlLjx6qG7QfnDhIoQdIf",
    "password": "camp@ioasys.com.br",
    "username": "tph4hyk!BZC2txm*mcb",
    "grantType": "password"
  };

  late final String jsonString = json.encode(userModelJson);

  // final String paramName = 'param'; // give the post param a name
  // late final String formBody =
  //     '$paramName=${Uri.encodeQueryComponent(jsonString)}';
  late final List<int> bodyBytes = utf8.encode(jsonString);

  final Map<String, dynamic> headers = {
    "Content-Type": "application/x-www-form-urlencoded",
    "charset": "UTF-8"
  };

  void loginPost() async {
    final response = await dio.post(
      baseUrl,
      data: bodyBytes,
      options: Options(
        contentType: "application/x-www-form-urlencoded",
        followRedirects: false,
        // validateStatus: (status) {
        //   return status! < 500;
        // },
      ),
    );
    debugPrint("Api statusCode:${response.statusCode}");
    debugPrint("Api statusMessage:${response.statusMessage}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "CAMP Login Page",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(
              width: 250,
              child: TextField(
                // style: TextStyle(backgroundColor: Colors.blue),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'usuario',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Botão"),
              onPressed: () => loginPost(),
            )
          ],
        ),
      ),
    );
  }
}

// class CampUserModel {
//   String clientId;
//   String clientSecret;
//   String username;
//   String password;

//   CampUserModel(
//       {required this.clientId,
//       required this.clientSecret,
//       required this.username,
//       required this.password});
// }

// class CampUserModel {
//   String clientId = '';
//   String clientSecret = '';
//   String password = '';
//   String username = '';
//   String grantType = '';

//   CampUserModel({
//     required this.clientId,
//     required this.clientSecret,
//     required this.password,
//     required this.username,
//     required this.grantType,
//   });

//   CampUserModel.fromJson(Map<String, dynamic> json) {
//     clientId = json['client_id'];
//     clientSecret = json['client_secret'];
//     password = json['password'];
//     username = json['username'];
//     grantType = json['grant_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['client_id'] = clientId;
//     data['client_secret'] = clientSecret;
//     data['password'] = password;
//     data['username'] = username;
//     data['grant_type'] = grantType;

//     return data;
//   }
// }
