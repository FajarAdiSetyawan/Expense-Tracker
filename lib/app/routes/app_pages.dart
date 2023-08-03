import 'package:get/get.dart';

import '../modules/add_account/bindings/add_account_binding.dart';
import '../modules/add_account/views/add_account_view.dart';
import '../modules/add_wallet/bindings/add_wallet_binding.dart';
import '../modules/add_wallet/views/add_wallet_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forgot_password_success/bindings/forgot_password_success_binding.dart';
import '../modules/forgot_password_success/views/forgot_password_success_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction_screen/bindings/introduction_screen_binding.dart';
import '../modules/introduction_screen/views/introduction_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/setup_account/bindings/setup_account_binding.dart';
import '../modules/setup_account/views/setup_account_view.dart';
import '../modules/setup_pin/bindings/setup_pin_binding.dart';
import '../modules/setup_pin/views/setup_pin_view.dart';
import '../modules/setup_retype_pin/bindings/setup_retype_pin_binding.dart';
import '../modules/setup_retype_pin/views/setup_retype_pin_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/sign_up_success/bindings/sign_up_success_binding.dart';
import '../modules/sign_up_success/views/sign_up_success_view.dart';
import '../modules/sign_up_verification/bindings/sign_up_verification_binding.dart';
import '../modules/sign_up_verification/views/sign_up_verification_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => const IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SUCCESS,
      page: () => const ForgotPasswordSuccessView(),
      binding: ForgotPasswordSuccessBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.SETUP_PIN,
      page: () => const SetupPinView(),
      binding: SetupPinBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.SETUP_RETYPE_PIN,
      page: () => const SetupRetypePinView(),
      binding: SetupRetypePinBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_VERIFICATION,
      page: () => const SignUpVerificationView(),
      binding: SignUpVerificationBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.SETUP_ACCOUNT,
      page: () => const SetupAccountView(),
      binding: SetupAccountBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.ADD_ACCOUNT,
      page: () => AddAccountView(),
      binding: AddAccountBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.ADD_WALLET,
      page: () => const AddWalletView(),
      binding: AddWalletBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Paths.SIGN_UP_SUCCESS,
      page: () => const SignUpSuccessView(),
      binding: SignUpSuccessBinding(),
      transition: Transition.circularReveal,
    ),
  ];
}
