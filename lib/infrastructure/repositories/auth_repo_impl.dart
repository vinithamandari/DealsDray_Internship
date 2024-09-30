import 'package:dealsdray_testapp/domain/auth_repository.dart';
import 'package:dealsdray_testapp/infrastructure/sources/remote_data_source.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> addDeviceInfo(Map<String, dynamic> data) async {
    try {
      final Response response = await remoteDataSource.post(
          'http://devapiv4.dealsdray.com/api/v2/user/device/add',
          data: data);
      if (response.statusCode == 200) {
        String data = response.data['data']['deviceId'].toString();
        return data;
      }
    } catch (e) {
      throw Exception(e);
    }
    return '';
  }

  @override
  Future<String> requestOtp(Map<String, dynamic> data) async {
    try {
      final Response response = await remoteDataSource
          .post('http://devapiv4.dealsdray.com/api/v2/user/otp', data: data);
      if (response.statusCode == 200) {
        String data = response.data['data']['userId'].toString();
        return data;
      }
    } catch (e) {
      throw Exception(e);
    }

    return '';
  }

  @override
  Future<String> verifyOtp(Map<String, dynamic> data) async {
    try {
      final Response response = await remoteDataSource.post(
          'http://devapiv4.dealsdray.com/api/v2/user/otp/verification',
          data: data);
      if (response.statusCode == 200) {
        String val = response.data['data']['message'].toString();
        String check;
        if (val.contains('Successfully verified mobile number')) {
          check = response.data['data']['registration_status'].toString();
          return check;
        } else {
          check = '';
        }
        return check;
      } else {
        throw Exception('status NOT FOUND');
      }
    } catch (e) {
      // return '';
      throw Exception(e);
    }
    // return '';
  }

  @override
  Future<void> register(Map<String, dynamic> data) async {
    try {
      final Response response = await remoteDataSource.post(
          'http://devapiv4.dealsdray.com/api/v2/user/email/referral',
          data: data);

      if (response.statusCode == 200) {
        // print(r)
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
