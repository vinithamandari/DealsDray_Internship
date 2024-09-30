
import 'package:dealsdray_testapp/domain/auth_repository.dart';

class RequestOtp {
  AuthRepository authRepository;
  RequestOtp(this.authRepository);

  Future<String> call(Map<String, dynamic> data) async {
    return await authRepository.requestOtp(data);
  }
}
