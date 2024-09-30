

import 'package:dealsdray_testapp/domain/auth_repository.dart';

class Register {
  AuthRepository authRepository;
  Register(this.authRepository);

  Future<void> call(Map<String, dynamic> data) async {
    await authRepository.register(data);
  }
}
