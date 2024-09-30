import 'package:dealsdray_testapp/presentation/providers/auth_provider.dart';
import 'package:dealsdray_testapp/presentation/providers/resendtimer_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _otpController = TextEditingController();
  // bool _isResending = false;
  int inputlenght = 0;
  int mobileNumber = 0;
  String otp = '';
  String _errorMessage = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileNumber = 0;
    otp = '';
    _errorMessage = '';
    Future.microtask(() {
      Provider.of<TimerProvider>(context, listen: false).startTimer();
    });
  }

  _navigate() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (auth.registrationStatus == 'Incomplete') {
      Navigator.of(context).pushReplacementNamed('/register');
    } else if (auth.registrationStatus == 'Complete') {
      Navigator.of(context).pushReplacementNamed('/mainScreen');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid OTP')));
    }
  }

  Future<String?> _verifyOtp(String enterdOtp) async {
    // return enterdOtp == otp;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await authProvider.otpVerification({
        'otp': enterdOtp,
        'userId': authProvider.userId
      });
      return null;
    } catch (e) {
      return 'Invalid OTP';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/otp.jpg',
              // fit: BoxFit.cover,
              scale: 1,
            ),
            //Some texts here
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OTP Verification',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, value, child) => Text(
                      'we have sent a unique OTP number to your mobile +91${value.mobileNumber}',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        // fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<AuthProvider>(
                            builder: (context, auth, child) => Pinput(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              defaultPinTheme: PinTheme(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    // color: Colors.grey,
                                    border: Border.all(
                                        width: 2, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  )),
                              focusedPinTheme: PinTheme(
                                  height: 60,
                                  width: 60,
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: BoxDecoration(
                                    // color: Colors.grey,
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  )),
                              validator: (value) {
                                // String otpnow = value!;
                                return _errorMessage.isEmpty
                                    ? null
                                    : _errorMessage;
                              },
                         
                              onCompleted: (value) async {
                                String? result = await _verifyOtp(value);
                                if (result == null) {
                                  _navigate();
                                } else {
                                  setState(() {
                                    _errorMessage = result;
                                  });
                                }
                              },
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer2<TimerProvider, AuthProvider>(
                    builder: (context, timer, auth, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: timer.isRunning ? true : false,
                            child: Text(
                              timer.formattedTime,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: timer.isRunning
                              ? null
                              : () {
                                  timer.startTimer();
                                  auth.otpRequest();
                                },
                          child: Text(
                            'Send Code',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: timer.isRunning
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
