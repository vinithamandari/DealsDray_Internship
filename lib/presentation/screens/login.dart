
import 'package:dealsdray_testapp/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  bool isPhone = true;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    isPhone = true;
    isButtonEnabled = false;
  }

  _otpRequest() async {

    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
        authProvider.mobileNumber=_phoneController.text.toString();
    try {
      await authProvider.otpRequest();
      Navigator.pushNamed(context, '/otp');
    } catch (e) {
      print('Some error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        'assets/images/logo.png',
                        // fit: BoxFit.cover,
                        scale: 2.5,
                      ),
                    ),
                    Text(
                      'DealsDray',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              //phone or email button part
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPhone = true;
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 6),
                            decoration: BoxDecoration(
                                color: isPhone ? Colors.red : null,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                  color: isPhone ? Colors.white : Colors.black),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPhone = false;
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                                horizontal: !isPhone ? 26 : 20, vertical: 6),
                            decoration: BoxDecoration(
                                color: !isPhone ? Colors.red : null,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  color:
                                      !isPhone ? Colors.white : Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ),

              //Some texts here
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Glad to see you!',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'please provide your phone number',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        // fontSize: 12
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      // key: _formKey,
                      child: TextFormField(
                        controller: _phoneController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.number,
                        // validator: (value) =>
                        //     (value!.length == 10) ? null : 'invalid input',
                        // onFieldSubmitted: (value) =>
                        //     _formKey.currentState!.validate,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value) {
                          setState(() {
                            if (value.length == 10) {
                              isButtonEnabled = true;
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: WidgetStatePropertyAll(
                                isButtonEnabled ? Colors.red : null),
                            foregroundColor:
                                const WidgetStatePropertyAll(Colors.white)),
                        onPressed: !isButtonEnabled
                            ? null
                            : () {
                                _otpRequest();
                              },
                        child: const Text('SEND CODE'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
