import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final AppLogger _logger = AppLogger();

  AuthRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, LoginResponse>> login(
      String email, String password) async {
    _logger.logInfo('Checking network connectivity for login');
    if (await networkInfo.isConnected) {
      _logger.logInfo('Network is connected, proceeding with login');
      try {
        final response = await remoteDataSource.login(email, password);
        _logger.logInfo('Login repository received response for email: $email');
        return Right(response);
      } catch (e, stackTrace) {
        _logger.logError('Error in login repository: $e', e, stackTrace);
        return Left(ServerFailure(e.toString()));
      }
    } else {
      _logger.logWarning('No internet connection for login attempt');
      return Left(NetworkFailure('No internet connection'));
    }
  }
}
