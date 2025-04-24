class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String role;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });
}
