import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lottie/lottie.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/auth/change_password_controller.dart';
import '../../utils/constants/data_constant.dart';

class LoginChangePasswordScreen extends StatefulWidget {
  const LoginChangePasswordScreen({super.key});

  @override
  State<LoginChangePasswordScreen> createState() =>
      _LoginChangePasswordScreenState();
}

class _LoginChangePasswordScreenState extends State<LoginChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool hasInternet = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();

    super.dispose();
  }

  bool passwordObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }

  Future<void> _handleChangePassword() async {
    /// 01 check input
    /// 02 check internet connectivity
    /// 03 check api

    final ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());
    final box = GetStorage();

    if (_oldPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty) {
      print('bearer token ${box.read('BearerToken')}');

      await changePasswordController.simulateChangePassword(
        _oldPasswordController.text,
        _newPasswordController.text,
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
        () => Get.offAllNamed('/me/loginSetting'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            backgroundColor: background02,
            appBar: changePasswordController.isLoading
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
                                Get.offAllNamed('/loginSetting');
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: w600_17(
                                  context, 'Change Password', blackColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            body: changePasswordController.isLoading
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
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                w400_16(
                                  context,
                                  'Old Password',
                                  blackColor,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // padding: const EdgeInsets.all(1.0),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 25),
                            child: TextFormField(
                              style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              cursorColor: secondaryColor,
                              keyboardType: TextInputType.text,
                              controller: _oldPasswordController,
                              obscureText: passwordObscured,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  top: 25,
                                  right: 10,
                                  bottom: 20,
                                ),
                                label: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Enter Old Password'),
                                  ],
                                ),
                                labelStyle:
                                    buttonText04Style(cardRadialColor01),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordObscured
                                        ? (Icons.visibility_off)
                                        : Icons.visibility,
                                    size: 20,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                filled: true,
                                fillColor: whiteColor,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              w400_16(
                                context,
                                'New Password',
                                blackColor,
                              ),
                            ],
                          ),
                          Container(
                            // padding: const EdgeInsets.all(1.0),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: TextFormField(
                              style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              cursorColor: secondaryColor,
                              keyboardType: TextInputType.text,
                              controller: _newPasswordController,
                              obscureText: passwordObscured,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  top: 25,
                                  right: 10,
                                  bottom: 20,
                                ),
                                label: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Enter New Password'),
                                  ],
                                ),
                                labelStyle:
                                    buttonText04Style(cardRadialColor01),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordObscured
                                        ? (Icons.visibility_off)
                                        : Icons.visibility,
                                    size: 20,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                filled: true,
                                fillColor: whiteColor,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _handleChangePassword,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height * 0.4,
                                left: 0,
                                right: 0,
                                bottom: screenSize.height * 0.02,
                              ),
                              child: Container(
                                height: screenSize.height * 0.06,
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: secondaryColor),
                                child: Center(
                                    child: w500_17(context, 'Save New Password',
                                        whiteColor)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
