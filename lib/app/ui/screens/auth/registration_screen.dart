import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

// import 'package:overlay_support/overlay_support.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../controllers/auth/sign_up_controller.dart';
import '../../../utils/constants/data_constant.dart';
import 'login_screen.dart';
import '../otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

enum ConnectivityResult {
  // wifi: device connected to wifi
  wifi,

  // mobile: device connected to cellular network
  mobile,

  // None: device not connected to any network
  none
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegisterController registerController = Get.put(RegisterController());
  void openBottomSheet() {
    showModalBottomSheet(
      //  enableDrag: false,
      isDismissible: false,
      // isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          margin: EdgeInsets.all(30),
          // height: screenSize.height * 0.35,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'lib/assets/success01.png',
                  // fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: w700_24(context, 'Verification Successful', blackColor),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: w400_14(
                  context,
                  'Your phone number has been verified',
                  textColorSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;

  Future<void> _handleRegistration() async {
    final RegisterController registerController = Get.put(RegisterController());

    if (_fullnameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        (isChecked == true)) {
      await registerController.simulateSignUp(
        _fullnameController.text,
        _emailController.text,
        _phoneNumberController.text,
        _passwordController.text,
        (message) => showTopSnackBar(
          snackBarPosition: SnackBarPosition.top,
          Overlay.of(context),
          CustomSnackBar.success(
            message: message,
          ),
        ),
        (message) => showTopSnackBar(
          snackBarPosition: SnackBarPosition.top,
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        ),
        () => Get.toNamed('/utpScreen'),
      );
    } else if (_fullnameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        (isChecked == false)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Center(child: Text("Please accept the terms and conditions.")),
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool passwordObscured = true;

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _referralController = TextEditingController();
  final _passwordController = TextEditingController();

  Color _registerButtonColor = btnDisabled;
  Color _registerButtonTextColor = whiteColor;

  @override
  void initState() {
    super.initState();
    _fullnameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _phoneNumberController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _fullnameController.removeListener(_updateButtonState);
    _emailController.removeListener(_updateButtonState);
    _phoneNumberController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);

    _fullnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _referralController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      if (_fullnameController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _registerButtonColor = secondaryColor;
        _registerButtonTextColor = whiteColor;
      } else {
        _registerButtonColor = btnDisabled;
        _registerButtonTextColor = whiteColor;
      }
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }

  void _navigateToOtpScreen() {
    if (_formKey.currentState?.validate() == true && isChecked) {
      Navigator.of(context).push(
        PageTransition(child: OtpScreen(), type: PageTransitionType.leftToRight
            // duration: Duration(seconds: 1),
            ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all fields and accept the terms."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final RegisterController registerController = Get.put(RegisterController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<RegisterController>(
        init: RegisterController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: registerController.isLoading
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
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenSize.height * 0.02),
                                _buildHeadingText(
                                    'Create Account', screenSize.width * 0.05),
                                _buildSubText02(
                                    'Start making transactions with ease...'),
                                _buildSubText(
                                  'Enjoy seamless transfer, payment of bills with ease on this platform.',
                                ),
                                SizedBox(height: 15),
                                _buildTextField(
                                  controller: _fullnameController,
                                  label: 'Full name',
                                  keyboardType: TextInputType.text,
                                  validator: (value) => value!.isEmpty
                                      ? 'Full name is required'
                                      : null,
                                ),
                                _buildTextField(
                                  controller: _emailController,
                                  label: 'Email Address',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email is required';
                                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                _buildTextField(
                                  controller: _phoneNumberController,
                                  label: 'Phone Number',
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => value!.isEmpty
                                      ? 'Phone number is required'
                                      : null,
                                ),
                                _buildTextField(
                                  controller: _referralController,
                                  label: 'Referral Code (Optional)',
                                  keyboardType: TextInputType.text,
                                ),
                                _buildPasswordTextField(),
                              ],
                            ),
                          ),
                          _buildCheckbox(),
                          _buildRegisterButton(screenSize),
                          _buildLoginPrompt(),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildHeadingText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: blackColor),
      ),
    );
  }

  Widget _buildSubText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(color: textColorSecondary, fontSize: 14),
      ),
    );
  }

  Widget _buildSubText02(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(color: blackColor, fontSize: 14),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: secondaryColor,
        controller: controller,
        keyboardType: keyboardType,
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
          labelText: label,
          labelStyle: TextStyle(
            color: textColorSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: validator,
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

  Widget _buildCheckbox() {
    return Row(
      children: [
        Checkbox.adaptive(
          activeColor: secondaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          value: isChecked,
          onChanged: (value) => setState(() => isChecked = value ?? false),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => isChecked = !isChecked),
            child: Text(
              'I have read and agreed to the Terms and Conditions',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: GestureDetector(
        // onTap: _navigateToOtpScreen,
        onTap: _handleRegistration,
        child: Container(
          height: screenSize.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _registerButtonColor,
          ),
          child: Center(
            child: Text(
              'Register',
              style: TextStyle(color: _registerButtonTextColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Already have an account?',
              style: TextStyle(
                color: blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                    child: LoginScreen(), type: PageTransitionType.leftToRight
                    // duration: Duration(seconds: 1),
                    ),
              );
            },
            child: Text('Login',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      ),
    );
  }
}
