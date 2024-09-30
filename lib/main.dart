

import 'package:dealsdray_testapp/domain/usecases/add_device_info.dart';
import 'package:dealsdray_testapp/domain/usecases/register.dart';
import 'package:dealsdray_testapp/domain/usecases/request_otp.dart';
import 'package:dealsdray_testapp/domain/usecases/verify_otp.dart';
import 'package:dealsdray_testapp/infrastructure/repositories/auth_repo_impl.dart';
import 'package:dealsdray_testapp/infrastructure/sources/remote_data_source.dart';
import 'package:dealsdray_testapp/presentation/providers/auth_provider.dart';
import 'package:dealsdray_testapp/presentation/providers/resendtimer_provider.dart';
import 'package:dealsdray_testapp/presentation/screens/home.dart';
import 'package:dealsdray_testapp/presentation/screens/login.dart';
import 'package:dealsdray_testapp/presentation/screens/otp.dart';
import 'package:dealsdray_testapp/presentation/screens/page.dart';
import 'package:dealsdray_testapp/presentation/screens/registration.dart';
import 'package:dealsdray_testapp/presentation/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final remoteDataSource = RemoteDataSource();
  final authRepository = AuthRepositoryImpl(remoteDataSource);

  final addDeviceInfo = AddDeviceInfo(authRepository);
  final requestOtp = RequestOtp(authRepository);
  final verifyOtp = VerifyOtp(authRepository);
  final register = Register(authRepository);
  final deviceId = '';
  final userId = '';
  final registrationStatus = '';
  final mobileNumber = '';

  runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
              addDeviceInfo: addDeviceInfo,
              requestOtp: requestOtp,
              verifyOtp: verifyOtp,
              register: register,
              deviceId: deviceId,
              userId: userId,
              registrationStatus: registrationStatus,
              mobileNumber: mobileNumber),
        ),
        ChangeNotifierProvider(
          create: (_) => TimerProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Authentication App',
      theme: ThemeData(
          // primarySwatch: Colors.red,
          colorSchemeSeed: Colors.red),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/otp': (context) => const OtpScreen(),
        '/home': (context) => const HomeScreen(),
        '/mainScreen': (context) => const PageScreen(),
      },
    );
  }
}
