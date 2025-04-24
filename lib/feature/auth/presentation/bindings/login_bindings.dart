import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sparktech_flutter/core/constants/api_endpoints.dart';

import '../../../../core/network/network_info.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecase/login_usecase.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(() => Connectivity());
    Get.lazyPut(() => NetworkInfoImpl(Get.find<Connectivity>()));
    Get.lazyPut(() => AuthRemoteDataSourceImpl(
          Get.find<http.Client>(),
          ApiEndpoints.baseUrl,
        ));
    Get.lazyPut(() => AuthRepositoryImpl(
          Get.find<AuthRemoteDataSourceImpl>(),
          Get.find<NetworkInfoImpl>(),
        ));
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()));
  }
}
