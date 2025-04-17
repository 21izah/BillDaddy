import 'package:billdaddy/app/utils/constants/nav_ids.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/FB_EgoFinance_Face_recognition_screen.dart';
import '../../ui/screens/FB_change_payment_pin.dart';
import '../../ui/screens/FB_face_confirmation_screen.dart';
import '../../ui/screens/FB_successful_screen.dart';
import '../../ui/screens/about_egoFinance_screen.dart';
import '../../ui/screens/add_payment_option_screen.dart';
import '../../ui/screens/autoSave_screen02.dart';
import '../../ui/screens/autosave_screen.dart';
import '../../ui/screens/autosave_withdraw_screen.dart';
import '../../ui/screens/change_payment_pin_screen.dart';
import '../../ui/screens/change_payment_successful_screen.dart';
import '../../ui/screens/login_FP_confirmation_screen.dart';
import '../../ui/screens/login_FP_face_recognition.dart';
import '../../ui/screens/login_FP_new_password_screen.dart';
import '../../ui/screens/login_FP_verify_phoneNumber_screen.dart';
import '../../ui/screens/login_change_password_screen.dart';
import '../../ui/screens/login_password_reminder_screen.dart';
import '../../ui/screens/login_setting_screen.dart';
import '../../ui/screens/me_screen02.dart';
import '../../ui/screens/payID_screen.dart';
import '../../ui/screens/payment_forgotPverify_number_screen.dart';
import '../../ui/screens/payment_settings_screen.dart';
import '../../ui/screens/payment_verify_BVN_screen .dart';
import '../../ui/screens/payment_verify_number_screen.dart';
import '../../ui/screens/privacy_policy_screen.dart';
import '../../ui/screens/safe_lock_balance_screen.dart';
import '../../ui/screens/safe_lock_screeen02.dart';
import '../../ui/screens/safe_lock_screen.dart';
import '../../ui/screens/safe_lock_successful.dart';
import '../../ui/screens/saving_setting_screen.dart';
import '../../ui/screens/scheduled_payment_screen.dart';
import '../../ui/screens/set_alert_subscription_screen.dart';
import '../../ui/screens/set_security_question02.dart';
import '../../ui/screens/set_security_question_screen.dart';
import '../../ui/screens/settings_screen.dart';
import '../../ui/screens/support_screen.dart';
import '../../ui/screens/terms_condition_screen.dart';
import '../../ui/screens/top_up_screen02.dart';
import '../../ui/screens/transaction_history_screen.dart';
import '../../ui/screens/transfer/transfer_to_egoFinace_screen_receipt.dart';
import '../../ui/screens/ussd_screen.dart';
import '../../ui/screens/verify_payment_pin_screen.dart';
import '../../ui/screens/withdrawCard_receipt_screen.dart';

class Me03 extends StatelessWidget {
  const Me03({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.me),
      onGenerateRoute: (settings) {
        if (settings.name == '/me/settings') {
          return GetPageRoute(
            settings: settings,
            page: () => const SettingsScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/about') {
          return GetPageRoute(
            settings: settings,
            page: () => const AboutEgofinanceScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/terms') {
          return GetPageRoute(
            settings: settings,
            page: () => const TermsConditionScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/privacy') {
          return GetPageRoute(
            settings: settings,
            page: () => const PrivacyPolicyScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/scheduledPayment') {
          return GetPageRoute(
            settings: settings,
            page: () => const ScheduledPaymentScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/setAlertSubscription') {
          return GetPageRoute(
            settings: settings,
            page: () => const setAlertSubscriptionScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/setSecurityQuestion') {
          return GetPageRoute(
            settings: settings,
            page: () => const SetSecurityQuestionScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/setSecurityQuestion02') {
          return GetPageRoute(
            settings: settings,
            page: () => const SetSecurityQuestion02(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/paymentSettings') {
          return GetPageRoute(
            settings: settings,
            page: () => const PaymentSettingsScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/verifyPaymentPin') {
          return GetPageRoute(
            settings: settings,
            page: () => const VerifyPaymentPinScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/paymentVerifyNumber') {
          return GetPageRoute(
            settings: settings,
            page: () => const PaymentVerifyNumberScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/paymentVerifyBvn') {
          return GetPageRoute(
            settings: settings,
            page: () => const PaymentVerifyBvnNumberScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/changePaymentPin') {
          return GetPageRoute(
            settings: settings,
            page: () => const ChangePaymentPinScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/forgotPasswordPaymentVerifyNumber') {
          return GetPageRoute(
            settings: settings,
            page: () => const ForgotPasswordPaymentVerifyNumberScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/fbFaceRecognition') {
          return GetPageRoute(
            settings: settings,
            page: () => const FbEgofinanceFaceRecognitionScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/fbFaceConfirmation') {
          return GetPageRoute(
            settings: settings,
            page: () => const FbFaceConfirmationScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/fbChangePaymentPin') {
          return GetPageRoute(
            settings: settings,
            page: () => const FbChangePaymentPin(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/fbSuccessful') {
          return GetPageRoute(
            settings: settings,
            page: () => const FbSuccessfulScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/changePaymentSuccessful') {
          return GetPageRoute(
            settings: settings,
            page: () => const ChangePaymentSuccessfulScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/savingSetting') {
          return GetPageRoute(
            settings: settings,
            page: () => const SavingSettingScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/autosave') {
          return GetPageRoute(
            settings: settings,
            page: () => const AutosaveScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginSetting') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginSettingScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginChangePassword') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginChangePasswordScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginVerifyPhoneNumber') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginVerifyPhonenumberScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginFpFaceRecognition') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginFpFaceRecognition(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginFpConfirmation') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginFpConfirmationScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginFpNewPassword') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginFpNewPasswordScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/loginPasswordReminder') {
          return GetPageRoute(
            settings: settings,
            page: () => const LoginPasswordReminderScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/safeLock') {
          return GetPageRoute(
            settings: settings,
            page: () => const SafeLockScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/safeLock02') {
          return GetPageRoute(
            settings: settings,
            page: () => const SafeLockScreeen02(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/safeLockSuccessful') {
          return GetPageRoute(
            settings: settings,
            page: () => const SafeLockSuccessful(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/safeLockBalance') {
          return GetPageRoute(
            settings: settings,
            page: () => const SafeLockBalanceScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/autosave02') {
          return GetPageRoute(
            settings: settings,
            page: () => const AutosaveScreen02(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/autosaveWithdraw') {
          return GetPageRoute(
            settings: settings,
            page: () => const AutosaveWithdrawScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/ussd') {
          return GetPageRoute(
            settings: settings,
            page: () => const UssdScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/payId') {
          return GetPageRoute(
            settings: settings,
            page: () => const PayidScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/support') {
          return GetPageRoute(
            settings: settings,
            page: () => const SupportScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/topUp02') {
          return GetPageRoute(
            settings: settings,
            page: () => const TopUpScreen02(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/addPaymentOption') {
          return GetPageRoute(
            settings: settings,
            page: () => const AddPaymentOptionScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/transferReceipt') {
          return GetPageRoute(
            settings: settings,
            page: () => const TransferToEgofinaceScreenReceipt(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/withdrawReceipt') {
          return GetPageRoute(
            settings: settings,
            page: () => const WithdrawcardReceiptScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/transactionHistory') {
          return GetPageRoute(
            settings: settings,
            page: () => const TransactionHistoryScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/about') {
          return GetPageRoute(
            settings: settings,
            page: () => const AboutEgofinanceScreen(),
            // page: () => const DashboardScreen(),
          );
        } else if (settings.name == '/me/about') {
          return GetPageRoute(
            settings: settings,
            page: () => const AboutEgofinanceScreen(),
            // page: () => const DashboardScreen(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => const MeScreen02(),
          );
        }
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name != '/me') {
      //     return GetPageRoute(
      //       settings: settings,
      //       page: () => const MeScreen02(),
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
