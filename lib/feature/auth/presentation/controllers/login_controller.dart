import 'package:get/get.dart';
import 'package:sparktech_flutter/core/components/snackbar_service.dart';

import '../../../../core/utils/logger.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final AppLogger _logger = AppLogger();

  LoginController(this.loginUseCase);

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    _logger.logInfo('Login attempt started for email: $email');
    isLoading.value = true;
    errorMessage.value = '';

    final result =
        await loginUseCase(LoginParams(email: email, password: password));

    result.fold(
      (failure) {
        _logger.logError('Login failed: ${failure.message}');
        errorMessage.value = failure.message;
      },
      (loginResponse) {
        _logger.logInfo(
            'Login successful, accessToken: ${loginResponse.accessToken}');
        SnackbarService.showSuccess(message: 'Login successful');
        Get.toNamed('/personalizing_course');
      },
    );

    isLoading.value = false;
    _logger.logDebug('Login attempt completed, isLoading: ${isLoading.value}');
  }
}
