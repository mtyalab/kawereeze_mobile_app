import 'dart:convert';

import 'package:kawereeze/utils/constant_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kawereeze/utils/app_exceptions.dart';
import '../model/user.dart';

abstract class AuthService {
  Future<User> login(String username, String password);
  Future<User> signup(String firstName, String surname, String phoneNumber,
      String email, String password);
  Future<dynamic> passwordResetRequest(String email);
  Future<dynamic> passwordResetRequestVerification(
      String otp, String accountIdentifier);
  Future<dynamic> newPassword(String username, String password);
}

class AuthRepository implements AuthService {
  @override
  Future<User> login(String username, String password) async {
      Uri uri = Uri.parse('$baseUrl/v0/auth/login');
      Map<String, dynamic> requestData = {
        "username": "${username}",
        "password": "${password}"
      };

      String requestBody = jsonEncode(requestData);

      Map<String, String> headers = {
        'Content-Type': 'application/json'
      };


      Response response = await http.post(
        uri,
        headers: headers,
        body: requestBody,
      );

      print('$response');

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw UnAuthorizedException(message: '${response.body}');
      }
  }

  @override
  Future<User> signup(String firstName, String surname, String phoneNumber,
      String email, String password) async {
    Uri uri = Uri.parse('$baseUrl/v0/auth/signup');
    Map<String, dynamic> requestData = {
      "first_name": "${firstName}",
      "surname": "${surname}",
      'phone_number': "${phoneNumber}",
      "email": "${email}",
      "role": 'borrower',
      "password": "${password}"
    };

    String requestBody = jsonEncode(requestData);

    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    Response response = await http.post(
        uri,
        headers: headers,
        body: requestBody);
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<dynamic> passwordResetRequest(String? email) async {
    Uri uri = Uri.parse('$baseUrl/v0/auth/user/password-reset');

    Map<String, dynamic> payload = {
      'username': email,
    };

    String requestBody = jsonEncode(payload);

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Response response = await http.post(uri,
        headers: headers,
        body: requestBody);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else {
      throw FailureException(message: jsonDecode(response.body));

    }
  }

  @override
  Future<dynamic> passwordResetRequestVerification(
      String otp, String? accountIdentifier) async {
    Uri uri = Uri.parse('$baseUrl/v0/auth/user/verify-otp/${accountIdentifier}');

    Map<String, dynamic> payload =  {
      'otp': otp,
    };

    String requestBody = jsonEncode(payload);

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Response response = await http.post(
        uri,
        headers: headers,
        body: requestBody);
    if  (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw FailureException(message: jsonDecode(response.body));
    }

  }

  @override
  Future<dynamic> newPassword(String? username, String? password) async {
    Uri uri = Uri.parse('$baseUrl/v0/auth/user/update-password/${username}');

    Map<String, dynamic> payload =  {
      'password': password,
    };

    String requestBody = jsonEncode(payload);

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };


    Response response =
        await http.put(uri,
            headers: headers,
            body: requestBody);

    if  (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw FailureException(message: jsonDecode(response.body));
    }
  }
}
