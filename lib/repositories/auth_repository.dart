import 'dart:convert';

import 'package:kawereeze/repositories/constant_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kawereeze/utils/app_exceptions.dart';
import '../model/user.dart';

abstract class AuthService {
  Future<User> login(String username, String password);
  Future<User> signup(String firstName, String surname, String phoneNumber,
      String email, String password);
  Future<User> passwordResetRequest(String email);
  Future<dynamic> passwordResetRequestVerification(
      String otp, String accountIdentifier);
  Future<User> newPassword(String username, String password);
}

class AuthRepository implements AuthService {
  @override
  Future<User> login(String username, String password) async {
      Uri uri = Uri.parse('$baseUrl/v0/auth/login');
      Response response = await http.post(
        uri,
        body: {'email': username, 'password': password},
      );

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
    Response response = await http.post(uri, body: {
      'firstName': firstName,
      'surname': surname,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password
    });
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<User> passwordResetRequest(String? email) async {
    Uri uri = Uri.parse('$baseUrl/v0/password-reset-request');
    Response response = await http.post(uri, body: {
      'email': email,
    });

    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<dynamic> passwordResetRequestVerification(
      String otp, String? accountIdentifier) async {
    Uri uri = Uri.parse('$baseUrl/v1/password-reset-request-verification');
    Response response = await http.post(uri, body: {
      'otp': otp,
      'accountIdentifier': accountIdentifier,
    });
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<User> newPassword(String? username, String? password) async {
    Uri uri = Uri.parse('$baseUrl/v1/update-password');
    Response response =
        await http.post(uri, body: {'email': username, 'password': password});

    return User.fromJson(jsonDecode(response.body));
  }
}
