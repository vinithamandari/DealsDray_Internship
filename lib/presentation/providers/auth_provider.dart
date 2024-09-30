import 'package:dealsdray_testapp/domain/usecases/add_device_info.dart';
import 'package:dealsdray_testapp/domain/usecases/register.dart';
import 'package:dealsdray_testapp/domain/usecases/request_otp.dart';
import 'package:dealsdray_testapp/domain/usecases/verify_otp.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AddDeviceInfo addDeviceInfo;
  final RequestOtp requestOtp;
  final VerifyOtp verifyOtp;
  final Register register;
  String deviceId;
  String userId;
  String registrationStatus;
  String mobileNumber;

  AuthProvider(
      {required this.addDeviceInfo,
      required this.requestOtp,
      required this.verifyOtp,
      required this.register,
      required this.deviceId,
      required this.userId,
      required this.registrationStatus,
      required this.mobileNumber});

  Future<void> deviceInfo(Map<String, dynamic> data) async {
    deviceId = await addDeviceInfo.call(data);
    notifyListeners();
  }

  Future<void> otpRequest() async {
    Map<String, dynamic> data = {
      'mobileNumber': mobileNumber,
      'deviceId': deviceId
    };
    // mobileNumber = data['mobileNumber'];
    // notifyListeners();
    userId = await requestOtp.call(data);
    notifyListeners();
  }

  Future<void> otpVerification(Map<String, dynamic> data) async {
    registrationStatus = await verifyOtp.call(data);
    notifyListeners();
  }

  Future<void> registerUser(Map<String, dynamic> data) async {
    await register.call(data);
  }
}
