import 'dart:convert';

import 'package:http/http.dart';
import 'package:kawereeze/model/reversal.dart';
import 'package:kawereeze/model/transaction.dart';

import 'package:http/http.dart' as http;

import '../utils/app_exceptions.dart';
import '../utils/constant_utils.dart';

abstract class TransactionService {
  Future<Transaction> getTransactions(String userId);
  Future<Transaction> initiateReversal(String transactionId, String userId);
  Future<Reversal> getReversals(String userId);
}

class TransactionRepository extends TransactionService {
  @override
  Future<Transaction> getTransactions(String? userId) async {
    Uri uri = Uri.parse('$baseUrl/v0/all-transactions/$userId');

    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'No transactions found! Retry or Contact support at: +256783423397');
    } else {
      throw FailureException(message: 'No internet connection. Please reconnect and retry');
    }
  }

  @override
  Future<Transaction> initiateReversal(
      String transactionId, String userId) async {
    Uri uri = Uri.parse('$baseUrl/v1/all-reversals/$transactionId/$userId');
    Response response = await http.post(uri, body: {
      'transactionId': transactionId,
      'id': userId,
    });
    return Transaction.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Reversal> getReversals(String userId) async {
    Uri uri = Uri.parse('$baseUrl/v0/all-reversals/$userId');
    Response response = await http.get(uri);

    return Reversal.fromJson(jsonDecode(response.body));
  }
}
