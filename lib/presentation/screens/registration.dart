import 'package:dealsdray_testapp/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  bool isPhone = true;
  bool isButtonEnabled = false;
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPhone = true;
    isButtonEnabled = false;
    isVisible = false;
  }

  _registerUser() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      Map<String, dynamic> data = {
        'email': _emailController.text.toString(),
        'password': _passwordController.text.toString(),
        'referral': int.tryParse(_referralController.text.toString()),
        'userId': authProvider.userId
      };
      await authProvider.register(data);

      Navigator.of(context).pushReplacementNamed('/mainScreen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some error occured: ${e.toString()}')));
    }
  }

  String? validateEmail(inputemail) {
    if (inputemail == null || inputemail.isEmpty) {
      return 'Email is required';
    }
    // Regular expression for email validation
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+[a-zA-Z0-9._%-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(inputemail)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(inputPwd) {
    if (inputPwd == null || inputPwd.isEmpty) {
      return 'Password is required';
    }
    if (inputPwd.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Regular expressions for optional password complexity requirements
    final RegExp hasUpperCase = RegExp(r'[A-Z]');
    final RegExp hasLowerCase = RegExp(r'[a-z]');
    final RegExp hasDigit = RegExp(r'\d');
    final RegExp hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!hasUpperCase.hasMatch(inputPwd)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!hasLowerCase.hasMatch(inputPwd)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!hasDigit.hasMatch(inputPwd)) {
      return 'Password must contain at least one number';
    }
    if (!hasSpecialChar.hasMatch(inputPwd)) {
      return 'Password must contain at least one special character';
    }

    return null;
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
                          fontSize: 28,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Some texts here
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lets begin!',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'please enter your credentials to proceed',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        // fontSize: 12
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.emailAddress,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus,
                            validator: (value) => validateEmail(value),
                            // onChanged: (value) => ,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                                labelText: 'Your Email',
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                )),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !isVisible,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.visiblePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => validatePassword(value),
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus,
                            decoration: InputDecoration(
                                labelText: 'Create Password',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      isVisible = !isVisible;

                                      setState(() {});
                                    },
                                    child: isVisible
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                )),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _referralController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.number,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                labelText: 'Referral Code (Optional)',
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                )),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registerUser,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
