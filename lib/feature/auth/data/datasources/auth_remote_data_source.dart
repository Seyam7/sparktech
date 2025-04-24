import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sparktech_flutter/core/constants/api_endpoints.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final String baseUrl;
  final AppLogger _logger = AppLogger();

  AuthRemoteDataSourceImpl(this.client, this.baseUrl);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    _logger.logInfo('Initiating login request for email: $email');
    try {
      final response = await client.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      _logger.logDebug('Login API response status: ${response.statusCode}');
      _logger.logDebug('Login API response body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          _logger.logInfo('Login successful for email: $email');
          return LoginResponseModel.fromJson(json);
        } else {
          _logger.logError('Login failed: ${json['message']}');
          throw ServerFailure(json['message'] ?? 'Login failed');
        }
      } else {
        _logger.logError('Server error: ${response.statusCode}');
        throw ServerFailure('Server error: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      _logger.logError('Exception during login: $e', e, stackTrace);
      throw ServerFailure('Login error: $e');
    }
  }
}
