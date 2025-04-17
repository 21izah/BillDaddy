import 'package:billdaddy/app/ui/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../controllers/auth/login_controller.dart';
import '../../../utils/constants/data_constant.dart';
import '../bottomNavigation.dart';
import 'registration_screen.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool passwordObscured = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Color _containerColor = btnDisabled;
  Color _containerTextColor = whiteColor;

  openBottomSheet({required String message}) {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              margin: EdgeInsets.all(20),
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'lib/assets/success.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      w700_20(context, '${message}', blackColor),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      // This block runs after the bottom sheet is closed
      // Navigate to the next page after the bottom sheet is closed
      Get.to(BottomNavigation());
    });

    // Close the bottom sheet after 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the bottom sheet
    });
  }

  Future<void> _handleLogin() async {
    // Validate form inputs
    if (_formKey.currentState?.validate() ?? false) {
      final LoginController loginController = Get.put(LoginController());

      final box = GetStorage();
      print('${_emailController.text}');
      print('${_passwordController.text}');

      await loginController.simulateLogin(
        _emailController.text,
        _passwordController.text,
        box.read('Device ID') ?? '',
        box.read('Device ID') ?? '',
        (message) async {
          await loginController.fetchUserAccountData();
          // Example: Call this after a successful login

          await openBottomSheet(message: message);
          // showTopSnackBar(
          //   snackBarPosition: SnackBarPosition.top,
          //   Overlay.of(context),
          //   CustomSnackBar.success(
          //     message: message,
          //   ),
          // );
        },
        (message) => showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: message),
        ),
        // () => Get.to(BaseScreen()),
      );
      // () => Get.offAllNamed('/bottomNav', arguments: 0));
    }
  }

  void _updateButtonState() {
    setState(() {
      if (_emailController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        _containerColor = secondaryColor;
        _containerTextColor = whiteColor;
      } else {
        _containerColor = btnDisabled;
        _containerTextColor = whiteColor;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final LoginController loginController = Get.put(LoginController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<LoginController>(
        init: LoginController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            appBar: loginController.isLoading
                ? null
                : AppBar(
                    backgroundColor: Colors.transparent,
                  ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: loginController.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset('lib/assets/rPUhRrTlFG.json'),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25, 25, 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height * 0.001),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.quicksand(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: blackColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Text(
                              'Sign in to your account',
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: textColorSecondary,
                              ),
                            ),
                          ),
                          _buildEmailField(),
                          _buildPasswordField(),
                          _buildForgotPasswordPrompt(),
                          _buildSignInButton(screenSize),
                          _buildRegisterPrompt(),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 85, 0, 10),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        cursorColor: secondaryColor,
        decoration: InputDecoration(
          labelText: 'Phone Number / Email',
          labelStyle: TextStyle(
            color: textColorSecondary,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
          ),
        ),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter your email';
        //   }
        //   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        //     return 'Please enter a valid email';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _passwordController,
        obscureText: passwordObscured,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        cursorColor: secondaryColor,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            color: textColorSecondary,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                passwordObscured = !passwordObscured;
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildForgotPasswordPrompt() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/forgotPasswordPage');
              // Handle forgot password
            },
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.quicksand(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: _handleLogin,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.15,
          left: screenSize.width * 0.02,
          right: screenSize.width * 0.02,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _containerColor,
          ),
          child: Center(
            child: Text(
              'Sign In',
              style: GoogleFonts.quicksand(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: _containerTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterPrompt() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Don't have an account?",
            style: GoogleFonts.quicksand(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: RegistrationScreen(),
                  type: PageTransitionType.leftToRight,
                ),
              );
            },
            child: Text(
              'Register',
              style: GoogleFonts.quicksand(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
