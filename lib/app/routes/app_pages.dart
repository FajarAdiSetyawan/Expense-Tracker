import 'package:get/get.dart';

import '../modules/Expense/bindings/expense_binding.dart';
import '../modules/Expense/views/expense_view.dart';
import '../modules/Income/bindings/income_binding.dart';
import '../modules/Income/views/income_view.dart';
import '../modules/Notification/bindings/notification_binding.dart';
import '../modules/Notification/views/notification_view.dart';
import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/add_account/bindings/add_account_binding.dart';
import '../modules/add_account/views/add_account_view.dart';
import '../modules/add_wallet/bindings/add_wallet_binding.dart';
import '../modules/add_wallet/views/add_wallet_view.dart';
import '../modules/budget/bindings/budget_binding.dart';
import '../modules/budget/views/budget_view.dart';
import '../modules/create_budget/bindings/create_budget_binding.dart';
import '../modules/create_budget/views/create_budget_view.dart';
import '../modules/detail_account/bindings/detail_account_binding.dart';
import '../modules/detail_account/views/detail_account_view.dart';
import '../modules/detail_budget/bindings/detail_budget_binding.dart';
import '../modules/detail_budget/views/detail_budget_view.dart';
import '../modules/detail_transaction/bindings/detail_transaction_binding.dart';
import '../modules/detail_transaction/views/detail_transaction_view.dart';
import '../modules/export/bindings/export_binding.dart';
import '../modules/export/views/export_view.dart';
import '../modules/financial_report/bindings/financial_report_binding.dart';
import '../modules/financial_report/views/financial_report_view.dart';
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
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
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
import '../modules/story_financial_report/bindings/story_financial_report_binding.dart';
import '../modules/story_financial_report/views/story_financial_report_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
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
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SUCCESS,
      page: () => const ForgotPasswordSuccessView(),
      binding: ForgotPasswordSuccessBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SETUP_PIN,
      page: () => const SetupPinView(),
      binding: SetupPinBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SETUP_RETYPE_PIN,
      page: () => const SetupRetypePinView(),
      binding: SetupRetypePinBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SIGN_UP_VERIFICATION,
      page: () => const SignUpVerificationView(),
      binding: SignUpVerificationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SETUP_ACCOUNT,
      page: () => const SetupAccountView(),
      binding: SetupAccountBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ADD_ACCOUNT,
      page: () => AddAccountView(),
      binding: AddAccountBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ADD_WALLET,
      page: () => const AddWalletView(),
      binding: AddWalletBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SIGN_UP_SUCCESS,
      page: () => const SignUpSuccessView(),
      binding: SignUpSuccessBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.INCOME,
      page: () => const IncomeView(),
      binding: IncomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.EXPENSE,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSACTION,
      page: () => const DetailTransactionView(),
      binding: DetailTransactionBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BUDGET,
      page: () => const BudgetView(),
      binding: BudgetBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.DETAIL_BUDGET,
      page: () => const DetailBudgetView(),
      binding: DetailBudgetBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.FINANCIAL_REPORT,
      page: () => const FinancialReportView(),
      binding: FinancialReportBinding(),
    ),
    GetPage(
      name: _Paths.STORY_FINANCIAL_REPORT,
      page: () => const StoryFinancialReportView(),
      binding: StoryFinancialReportBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BUDGET,
      page: () => const CreateBudgetView(),
      binding: CreateBudgetBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT,
      page: () => const ExportView(),
      binding: ExportBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ACCOUNT,
      page: () => const DetailAccountView(),
      binding: DetailAccountBinding(),
    ),
  ];
}
