

import 'package:dealsdray_testapp/domain/auth_repository.dart';

class VerifyOtp {
  AuthRepository authRepository;
  VerifyOtp(this.authRepository);

  Future<String> call(Map<String, dynamic> data) async {
    return await authRepository.verifyOtp(data);
  }
}
