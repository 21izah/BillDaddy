import 'package:billdaddy/app/controllers/base_controller.dart';
import 'package:billdaddy/app/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

// Import all your screens
import 'app/controllers/transfer/transfer_controller.dart';
import 'app/controllers/transfer/transfer_to_other_bank_provider.dart';
import 'app/ui/screens/Recharge_screen.dart';
import 'app/ui/screens/about_egoFinance_screen.dart';
import 'app/ui/screens/account_limit_screen.dart';
import 'app/ui/screens/add_money_screen.dart';
import 'app/ui/screens/betting_screen.dart';
import 'app/ui/screens/bottomNavigation.dart';
import 'app/ui/screens/cardTabCSreen02.dart';
import 'app/ui/screens/card_application_screen.dart';
import 'app/ui/screens/cards_screen02.dart';
import 'app/ui/screens/data_screen.dart';
import 'app/ui/screens/electricity_screen.dart';
import 'app/ui/screens/forgotPassword_otpScreen.dart';
import 'app/ui/screens/forgotPassword_screen.dart';
import 'app/ui/screens/forgot_password_update_screen.dart';
import 'app/ui/screens/giftcard_screen.dart';
import 'app/ui/screens/home_deliviery_screen.dart';
import 'app/ui/screens/internet_service_screen.dart';
import 'app/ui/screens/kyc_screen.dart';
import 'app/ui/screens/auth/login_screen.dart';
import 'app/ui/screens/nearby_merchant_screen.dart';
import 'app/ui/screens/onboarding_screen.dart';
import 'app/ui/screens/otp_screen.dart';
import 'app/ui/screens/payment_verify_BVN_screen .dart';
import 'app/ui/screens/refer_and_earn_screen.dart';
import 'app/ui/screens/auth/registration_screen.dart';
import 'app/ui/screens/reward_screen.dart';
import 'app/ui/screens/splash_screen.dart';
import 'app/ui/screens/FB_EgoFinance_Face_recognition_screen.dart';
import 'app/ui/screens/FB_change_payment_pin.dart';
import 'app/ui/screens/FB_face_confirmation_screen.dart';
import 'app/ui/screens/FB_successful_screen.dart';
import 'app/ui/screens/add_payment_option_screen.dart';
import 'app/ui/screens/autoSave_screen02.dart';
import 'app/ui/screens/autosave_screen.dart';
import 'app/ui/screens/autosave_withdraw_screen.dart';
import 'app/ui/screens/change_payment_pin_screen.dart';
import 'app/ui/screens/change_payment_successful_screen.dart';
import 'app/ui/screens/login_FP_confirmation_screen.dart';
import 'app/ui/screens/login_FP_face_recognition.dart';
import 'app/ui/screens/login_FP_new_password_screen.dart';
import 'app/ui/screens/login_FP_verify_phoneNumber_screen.dart';
import 'app/ui/screens/login_change_password_screen.dart';
import 'app/ui/screens/login_password_reminder_screen.dart';
import 'app/ui/screens/login_setting_screen.dart';
import 'app/ui/screens/payID_screen.dart';
import 'app/ui/screens/payment_forgotPverify_number_screen.dart';
import 'app/ui/screens/payment_settings_screen.dart';

import 'app/ui/screens/payment_verify_number_screen.dart';
import 'app/ui/screens/privacy_policy_screen.dart';
import 'app/ui/screens/safe_lock_balance_screen.dart';
import 'app/ui/screens/safe_lock_screeen02.dart';
import 'app/ui/screens/safe_lock_screen.dart';
import 'app/ui/screens/safe_lock_successful.dart';
import 'app/ui/screens/saving_setting_screen.dart';
import 'app/ui/screens/scheduled_payment_screen.dart';
import 'app/ui/screens/set_alert_subscription_screen.dart';
import 'app/ui/screens/set_security_question02.dart';
import 'app/ui/screens/set_security_question_screen.dart';
import 'app/ui/screens/support_screen.dart';
import 'app/ui/screens/terms_condition_screen.dart';
import 'app/ui/screens/top_up_screen02.dart';
import 'app/ui/screens/transaction_history_screen.dart';
import 'app/ui/screens/transfer_screen.dart';
import 'app/ui/screens/transfer/transfer_to_egoFinace_screen_receipt.dart';
import 'app/ui/screens/tv_sub_screen.dart';
import 'app/ui/screens/update_profile_screen.dart';
import 'app/ui/screens/ussd_screen.dart';
import 'app/ui/screens/verify_payment_pin_screen.dart';
import 'app/ui/screens/withdrawCard_receipt_screen.dart';
import 'app/ui/screens/withdraw_screen.dart';
import 'app/ui/screens/dashboard_screen.dart';
import 'app/ui/screens/invest_screen.dart';
import 'app/ui/screens/invest_screen02.dart';
import 'app/ui/screens/payment_screen.dart';
import 'app/ui/screens/cardtabcsreen.dart';

import 'app/ui/screens/settings_screen.dart';
import 'app/ui/screens/me_screen02.dart';

void main() async {
  Get.put(ScrollController());
  Get.put(BaseController());
  Get.put(LoginController());
  Get.put(TransferController());
  Get.put(TransferToOtherBankController());
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // Initialize GetStorage
  await GetStorage.init();
  // await Hive.initFlutter();
  // await Hive.openBox('settingsBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorObservers: [GetObserver()],
      getPages: [
        // Top-level routes
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/bottomNav', page: () => BottomNavigation()),
        GetPage(name: '/registrationScreen', page: () => RegistrationScreen()),
        GetPage(name: '/loginScreen', page: () => LoginScreen()),
        GetPage(name: '/onboardingScreen', page: () => OnboardingPage()),
        GetPage(name: '/utpScreen', page: () => OtpScreen()),
        GetPage(name: '/rechargeScreen', page: () => RechargeScreen()),
        GetPage(name: '/electricityScreen', page: () => ElectricityScreen()),
        GetPage(name: '/dataScreen', page: () => DataScreen()),
        GetPage(name: '/bettingScreen', page: () => BettingScreen()),
        GetPage(name: '/gitcardScreen', page: () => GiftcardScreen()),
        GetPage(name: '/internetScreen', page: () => InternetServiceScreen()),
        GetPage(name: '/tvScreen', page: () => TvSubScreen()),
        GetPage(name: '/addMoneyScreen', page: () => AddMoneyScreen()),
        GetPage(name: '/transferScreen', page: () => TransferScreen()),
        GetPage(name: '/withdrawScreen', page: () => WithdrawScreen()),
        GetPage(name: '/topUp02', page: () => TopUpScreen02()),
        GetPage(
            name: '/transactionHistory',
            page: () => TransactionHistoryScreen()),
        GetPage(
            name: '/transferReceipt',
            page: () => TransferToEgofinaceScreenReceipt()),
        GetPage(
            name: '/cardApplicationScreen',
            page: () => CardApplicationScreen()),
        GetPage(name: '/cardTab02', page: () => CardsScreen02()),
        GetPage(name: '/homeDelivery', page: () => HomeDelivieryScreen()),
        GetPage(name: '/nearbyMerchant', page: () => NearbyMerchantScreen()),
        GetPage(name: '/payId', page: () => const PayidScreen()),
        GetPage(name: '/kycScreen', page: () => const KycScreen()),
        GetPage(name: '/ussd', page: () => const UssdScreen()),
        GetPage(
            name: '/referAndEarnScreen',
            page: () => const ReferAndEarnScreen()),
        GetPage(
            name: '/addPaymentOption',
            page: () => const AddPaymentOptionScreen()),
        GetPage(
            name: '/AccountLimitScreen',
            page: () => const AccountLimitScreen()),
        GetPage(name: '/about', page: () => const AboutEgofinanceScreen()),
        GetPage(name: '/terms', page: () => const TermsConditionScreen()),
        GetPage(name: '/privacy', page: () => const PrivacyPolicyScreen()),
        GetPage(
            name: '/scheduledPayment',
            page: () => const ScheduledPaymentScreen()),
        GetPage(
            name: '/setAlertSubscription',
            page: () => const setAlertSubscriptionScreen()),
        GetPage(
            name: '/setSecurityQuestion',
            page: () => const SetSecurityQuestionScreen()),
        GetPage(
            name: '/savingSetting', page: () => const SavingSettingScreen()),
        GetPage(name: '/autosave', page: () => const AutosaveScreen()),
        GetPage(name: '/safeLock', page: () => const SafeLockScreen()),
        GetPage(
            name: '/setSecurityQuestion02',
            page: () => const SetSecurityQuestion02()),
        GetPage(
            name: '/paymentSettings',
            page: () => const PaymentSettingsScreen()),
        GetPage(
            name: '/verifyPaymentPin',
            page: () => const VerifyPaymentPinScreen()),
        GetPage(
            name: '/forgotPasswordPaymentVerifyNumber',
            page: () => const ForgotPasswordPaymentVerifyNumberScreen()),
        GetPage(
            name: '/paymentVerifyNumber',
            page: () => const PaymentVerifyNumberScreen()),
        GetPage(
            name: '/paymentVerifyBvn',
            page: () => const PaymentVerifyBvnNumberScreen()),
        GetPage(
            name: '/changePaymentPin',
            page: () => const ChangePaymentPinScreen()),
        GetPage(
            name: '/changePaymentSuccessful',
            page: () => const ChangePaymentSuccessfulScreen()),
        GetPage(
            name: '/fbFaceRecognition',
            page: () => const FbEgofinanceFaceRecognitionScreen()),
        GetPage(
            name: '/fbFaceConfirmation',
            page: () => const FbFaceConfirmationScreen()),
        GetPage(
            name: '/fbChangePaymentPin',
            page: () => const FbChangePaymentPin()),
        GetPage(name: '/fbSuccessful', page: () => const FbSuccessfulScreen()),
        GetPage(name: '/loginSetting', page: () => const LoginSettingScreen()),
        GetPage(
            name: '/loginChangePassword',
            page: () => const LoginChangePasswordScreen()),
        GetPage(
            name: '/loginVerifyPhoneNumber',
            page: () => const LoginVerifyPhonenumberScreen()),
        GetPage(
            name: '/LoginPasswordReminderScreen',
            page: () => const LoginPasswordReminderScreen()),
        GetPage(
            name: '/loginFpFaceRecognition',
            page: () => const LoginFpFaceRecognition()),
        GetPage(
            name: '/loginFpConfirmation',
            page: () => const LoginFpConfirmationScreen()),
        GetPage(
            name: '/loginFpNewPassword',
            page: () => const LoginFpNewPasswordScreen()),
        GetPage(name: '/autosave02', page: () => const AutosaveScreen02()),
        GetPage(
            name: '/autosaveWithdraw',
            page: () => const AutosaveWithdrawScreen()),
        GetPage(name: '/safeLock02', page: () => const SafeLockScreeen02()),
        GetPage(
            name: '/safeLockSuccessful',
            page: () => const SafeLockSuccessful()),
        GetPage(
            name: '/safeLockBalance',
            page: () => const SafeLockBalanceScreen()),
        GetPage(
            name: '/forgotPasswordPage',
            page: () => const ForgotPasswordPage()),
        GetPage(
          name: '/forgotpasswordOtpscreen/:email',
          page: () {
            final email = Get.parameters['email'] ?? '';
            return ForgotpasswordOtpscreen(email: email);
          },
        ),
        GetPage(
            name: '/updateProfileScreen',
            page: () => const UpdateProfileScreen()),
        GetPage(
            name: '/forgotPasswordUpdateScreen',
            page: () => const ForgotPasswordUpdateScreen()),

        // Nested routes for bottom navigation
        GetPage(
          name: '/home',
          page: () => DashboardScreen(),
          children: [
            GetPage(name: '/reward', page: () => RewardScreen()),
          ],
        ),
        GetPage(
          name: '/invest',
          participatesInRootNavigator: false, // Ensures a separate navigator
          page: () => InvestScreen(),
          children: [
            GetPage(name: '/invest02', page: () => InvestScreen02()),
          ],
        ),
        GetPage(name: '/payment', page: () => PaymentScreen(), children: []),
        GetPage(
          name: '/cards',
          page: () => Cardtabcsreen(),
          children: [
            GetPage(name: '/cardTab02', page: () => CardsScreen02()),
          ],
        ),
        GetPage(
          name: '/me',
          page: () => MeScreen02(),
          children: [
            GetPage(name: '/settings', page: () => SettingsScreen()),
            GetPage(name: '/about', page: () => AboutEgofinanceScreen()),
            GetPage(name: '/terms', page: () => TermsConditionScreen()),
            GetPage(name: '/privacy', page: () => PrivacyPolicyScreen()),
            GetPage(
                name: '/scheduledPayment',
                page: () => ScheduledPaymentScreen()),
            GetPage(
                name: '/setAlertSubscription',
                page: () => setAlertSubscriptionScreen()),
            GetPage(
                name: '/setSecurityQuestion',
                page: () => SetSecurityQuestionScreen()),
            GetPage(
                name: '/setSecurityQuestion02',
                page: () => SetSecurityQuestion02()),
            GetPage(
                name: '/paymentSettings', page: () => PaymentSettingsScreen()),
            GetPage(
                name: '/verifyPaymentPin',
                page: () => VerifyPaymentPinScreen()),
            GetPage(
                name: '/paymentVerifyNumber',
                page: () => PaymentVerifyNumberScreen()),
            GetPage(
                name: '/paymentVerifyBvn',
                page: () => PaymentVerifyBvnNumberScreen()),
            GetPage(
                name: '/changePaymentPin',
                page: () => ChangePaymentPinScreen()),
            GetPage(
                name: '/forgotPasswordPaymentVerifyNumber',
                page: () => ForgotPasswordPaymentVerifyNumberScreen()),
            GetPage(
                name: '/fbFaceRecognition',
                page: () => FbEgofinanceFaceRecognitionScreen()),
            GetPage(
                name: '/fbFaceConfirmation',
                page: () => FbFaceConfirmationScreen()),
            GetPage(
                name: '/fbChangePaymentPin', page: () => FbChangePaymentPin()),
            GetPage(name: '/fbSuccessful', page: () => FbSuccessfulScreen()),
            GetPage(
                name: '/changePaymentSuccessful',
                page: () => ChangePaymentSuccessfulScreen()),
            GetPage(name: '/savingSetting', page: () => SavingSettingScreen()),
            GetPage(name: '/autosave', page: () => AutosaveScreen()),
            GetPage(name: '/loginSetting', page: () => LoginSettingScreen()),
            GetPage(
                name: '/loginChangePassword',
                page: () => LoginChangePasswordScreen()),
            GetPage(
                name: '/loginVerifyPhoneNumber',
                page: () => LoginVerifyPhonenumberScreen()),
            GetPage(
                name: '/loginFpFaceRecognition',
                page: () => LoginFpFaceRecognition()),
            GetPage(
                name: '/loginFpConfirmation',
                page: () => LoginFpConfirmationScreen()),
            GetPage(
                name: '/loginFpNewPassword',
                page: () => LoginFpNewPasswordScreen()),
            GetPage(
                name: '/loginPasswordReminder',
                page: () => LoginPasswordReminderScreen()),
            GetPage(name: '/safeLock', page: () => SafeLockScreen()),
            GetPage(name: '/safeLock02', page: () => SafeLockScreeen02()),
            GetPage(
                name: '/safeLockSuccessful', page: () => SafeLockSuccessful()),
            GetPage(
                name: '/safeLockBalance', page: () => SafeLockBalanceScreen()),
            GetPage(name: '/autosave02', page: () => AutosaveScreen02()),
            GetPage(
                name: '/autosaveWithdraw',
                page: () => AutosaveWithdrawScreen()),
            GetPage(name: '/ussd', page: () => UssdScreen()),
            GetPage(name: '/payId', page: () => PayidScreen()),
            GetPage(name: '/support', page: () => SupportScreen()),
            GetPage(name: '/topUp02', page: () => TopUpScreen02()),
            GetPage(
                name: '/addPaymentOption',
                page: () => AddPaymentOptionScreen()),
            GetPage(
                name: '/transferReceipt',
                page: () => TransferToEgofinaceScreenReceipt()),
            GetPage(
                name: '/withdrawReceipt',
                page: () => WithdrawcardReceiptScreen()),
            GetPage(
                name: '/transactionHistory',
                page: () => TransactionHistoryScreen()),
            GetPage(name: '/about', page: () => AboutEgofinanceScreen()),
          ],
        ),
      ],
    );
  }
}
