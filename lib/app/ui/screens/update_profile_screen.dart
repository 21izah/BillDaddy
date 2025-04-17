import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../controllers/update_user_controller.dart';
import '../../utils/constants/data_constant.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  Future<void> _handleUserUpdate() async {
    final UpdateUserDetailsController updateUserDetailsController =
        Get.put(UpdateUserDetailsController());

    await updateUserDetailsController.simulateUpdateUserDetails(
        _fullnameController.text,
        _emailController.text,
        _phoneNumberController.text,
        (message) => showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(message: message),
            ),
        (message) => showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: message),
            ),
        () => Get.offAllNamed('/updateProfileScreen'));
    await updateUserDetailsController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final UpdateUserDetailsController updateUserDetailsController =
        Get.put(UpdateUserDetailsController());
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: updateUserDetailsController.isLoading
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
                            Get.offAllNamed('/me');
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: w600_17(context, 'Update Profile', blackColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        body: updateUserDetailsController.isLoading
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSubText02('Update your details...'),
                    SizedBox(height: 15),
                    _buildTextField(
                      controller: _fullnameController,
                      label: 'Full Name',
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value!.isEmpty ? 'Full name is required' : null,
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
                      validator: (value) =>
                          value!.isEmpty ? 'Phone number is required' : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 261.0),
                      child: _buildRegisterButton(screenSize),
                    ),
                  ],
                ),
              ));
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

  Widget _buildRegisterButton(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: GestureDetector(
        // onTap: _navigateToOtpScreen,
        onTap: _handleUserUpdate,
        child: Container(
          height: screenSize.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: secondaryColor,
          ),
          child: Center(
            child: Text(
              'Save Details',
              style: TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
