import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/auth/forgotten_password_controller.dart';
import '../../utils/constants/data_constant.dart';

class ForgotPasswordUpdateScreen extends StatefulWidget {
  const ForgotPasswordUpdateScreen({super.key});

  @override
  State<ForgotPasswordUpdateScreen> createState() =>
      _ForgotPasswordUpdateScreenState();
}

class _ForgotPasswordUpdateScreenState
    extends State<ForgotPasswordUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordObscured = true;
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }

  Future passwordRest() async {
    // Validate form inputs
    if (_formKey.currentState?.validate() ?? false) {
      final ForgottenPasswordController forgottenPasswordController =
          Get.put(ForgottenPasswordController());
      final box = GetStorage();

      // await _username.put('forgotPasswordemail', _emailController.text);

      await forgottenPasswordController.simulateForgetPassword(
          _passwordController.text,
          (message) => showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(message: message),
              ),
          (message) => showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: message),
              ),
          () => Get.offAllNamed('/loginScreen'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ForgottenPasswordController forgottenPasswordController =
        Get.put(ForgottenPasswordController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: forgottenPasswordController.isLoading
          ? null
          : AppBar(
              backgroundColor: whiteColor,
              leadingWidth: screenSize.width,
              leading: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * 0.05,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed('/loginScreen');

                          // Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      resizeToAvoidBottomInset: false,
      body: forgottenPasswordController.isLoading
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
                          vertical: 0, horizontal: 0),
                      child: Text(
                        'Update Password',
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
                        'Update your paswword',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColorSecondary,
                        ),
                      ),
                    ),
                    _buildPasswordTextField(),
                    _buildConfirmPasswordTextField(),
                    _buildSignInButton(screenSize),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: secondaryColor,
        controller: _passwordController,
        obscureText: passwordObscured,
        style: TextStyle(color: blackColor),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: textColorSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                passwordObscured ? Icons.visibility_off : Icons.visibility),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        validator: (value) => value!.isEmpty ? 'Password is required' : null,
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: secondaryColor,
        controller: _confirmPasswordController,
        obscureText: passwordObscured,
        style: TextStyle(color: blackColor),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor),
            borderRadius: BorderRadius.circular(0),
          ),
          labelText: 'Confirm Password',
          labelStyle: TextStyle(
            color: textColorSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                passwordObscured ? Icons.visibility_off : Icons.visibility),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        validator: (value) => value!.isEmpty ? 'Password is required' : null,
      ),
    );
  }

  Widget _buildSignInButton(Size screenSize) {
    return GestureDetector(
      onTap: passwordRest,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.15,
          left: 0,
          right: 0,
          bottom: screenSize.height * 0.02,
        ),
        child: Container(
          height: screenSize.height * 0.06,
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: secondaryColor,
          ),
          child: Center(
            child: Text(
              'Save',
              style: GoogleFonts.quicksand(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
