import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(String email, String password);
}
