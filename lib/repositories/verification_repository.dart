import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/verification.dart';
import '../utils/app_exceptions.dart';
import '../utils/constant_utils.dart';


abstract class VerificationService {

  Future<Verifications> getVerificationByUserId(String userId);
}

class VerificationRepo implements VerificationService {


  @override
  Future<Verifications> getVerificationByUserId(String userId) async {
    Uri uri = Uri.parse('$baseUrl/identity/$userId');
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return Verifications.fromJson(jsonDecode(response.body));
    } else {
      throw FailureException(message: 'Unable to load verification data!');
    }
  }

}
