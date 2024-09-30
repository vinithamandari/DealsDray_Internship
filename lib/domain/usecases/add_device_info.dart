
import 'package:dealsdray_testapp/domain/auth_repository.dart';

class AddDeviceInfo {
  final AuthRepository repository;

  AddDeviceInfo(this.repository);

  Future<String> call(Map<String, dynamic> data) async {
    return await repository.addDeviceInfo(data);
  }
}
