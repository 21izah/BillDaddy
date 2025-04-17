import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/data_constant.dart';

class LoginPasswordReminderScreen extends StatefulWidget {
  const LoginPasswordReminderScreen({super.key});

  @override
  State<LoginPasswordReminderScreen> createState() =>
      _LoginPasswordReminderScreenState();
}

class _LoginPasswordReminderScreenState
    extends State<LoginPasswordReminderScreen> {
  bool isSavedPasswordChecked = false;
  bool isDontSavePassword = false;
  bool isMakePasswordField = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background02,
      appBar: AppBar(
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
                    // Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: w600_17(context, 'Password Reminder', blackColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color.fromRGBO(217, 217, 217, 1),
                      )),
                  // height: screenSize.height * 0.2,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w500_14(
                            context,
                            'Save Password',
                            blackColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_12(
                              context,
                              'Save your password to avoid problem',
                              Color.fromRGBO(151, 151, 151, 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 24,
                                width: 24,
                                child: Transform.scale(
                                  // scaleX: 0.7,
                                  // scaleY: 0.7,
                                  scale:
                                      0.7, // Adjust the scale factor to control the size
                                  child: SizedBox(
                                    child: Transform.scale(
                                      // scaleX: 0.7,
                                      // scaleY: 0.7,
                                      scale:
                                          1.3, // Adjust the scale factor to control the size
                                      child: Container(
                                        child: Checkbox.adaptive(
                                          activeColor: secondaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          value: isSavedPasswordChecked,
                                          onChanged: (value) => setState(() =>
                                              isSavedPasswordChecked =
                                                  value ?? false),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w400_12(
                            context,
                            'while signing in',
                            Color.fromRGBO(151, 151, 151, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color.fromRGBO(217, 217, 217, 1),
                      )),
                  // height: screenSize.height * 0.2,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w500_14(
                            context,
                            'Don’t save password',
                            blackColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_12(
                              context,
                              'Enter password whenever you open',
                              Color.fromRGBO(151, 151, 151, 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 24,
                                width: 24,
                                child: Transform.scale(
                                  // scaleX: 0.7,
                                  // scaleY: 0.7,
                                  scale:
                                      0.7, // Adjust the scale factor to control the size
                                  child: SizedBox(
                                    child: Transform.scale(
                                      // scaleX: 0.7,
                                      // scaleY: 0.7,
                                      scale:
                                          1.3, // Adjust the scale factor to control the size
                                      child: Container(
                                        child: Checkbox.adaptive(
                                          activeColor: secondaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          value: isDontSavePassword,
                                          onChanged: (value) => setState(() =>
                                              isDontSavePassword =
                                                  value ?? false),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w400_12(
                            context,
                            'the app',
                            Color.fromRGBO(151, 151, 151, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color.fromRGBO(217, 217, 217, 1),
                      )),
                  // height: screenSize.height * 0.2,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          w500_14(
                            context,
                            'Make Password Field Default',
                            blackColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w400_12(
                              context,
                              'No need to type password again',
                              Color.fromRGBO(151, 151, 151, 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 24,
                                width: 24,
                                child: Transform.scale(
                                  // scaleX: 0.7,
                                  // scaleY: 0.7,
                                  scale:
                                      0.7, // Adjust the scale factor to control the size
                                  child: SizedBox(
                                    child: Transform.scale(
                                      // scaleX: 0.7,
                                      // scaleY: 0.7,
                                      scale:
                                          0.7, // Adjust the scale factor to control the size
                                      child: SizedBox(
                                        child: Switch.adaptive(
                                          activeColor: secondaryColor,
                                          value: isMakePasswordField,
                                          onChanged: (value) => setState(() =>
                                              isMakePasswordField = value),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
