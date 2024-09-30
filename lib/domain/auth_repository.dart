abstract class AuthRepository {
  Future<String> addDeviceInfo(Map<String, dynamic> data);
  Future<String> requestOtp(Map<String, dynamic> data);
  Future<String> verifyOtp(Map<String, dynamic> data);
  Future<void> register(Map<String, dynamic> data);
}
