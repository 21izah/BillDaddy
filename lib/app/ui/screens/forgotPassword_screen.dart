// ignore_for_file: unused_import, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/auth/forgotten_password_controller.dart';
import '../../utils/constants/data_constant.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future passwordRest() async {
    // Validate form inputs
    if (_formKey.currentState?.validate() ?? false) {
      final ForgottenPasswordController forgottenPasswordController =
          Get.put(ForgottenPasswordController());
      final box = GetStorage();

      await box.write('forgotPasswordemail', _emailController.text);

      await forgottenPasswordController.simulateForgetPassword(
          _emailController.text,
          (message) => showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(message: message),
              ),
          (message) => showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: message),
              ),
          () => Get.offAllNamed(
              '/forgotpasswordOtpscreen/${_emailController.text}')

          // context.pushReplacement(
          //     '/forgotpasswordOtpscreen/${_emailController.text}')

          );
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
                        'Input required detail',
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
                        'Provide your phone number to receive OTP',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColorSecondary,
                        ),
                      ),
                    ),
                    _buildEmailField(),
                    _buildSignInButton(screenSize),
                  ],
                ),
              ),
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
          labelText: 'Phone Number',
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
              'Continue',
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
