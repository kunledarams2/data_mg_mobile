
import 'package:data_mangr/route/routes.dart';
import 'package:data_mangr/views/auth/presentation/registration/registrationPage.dart';
import 'package:get/get.dart';
import '../core/core_binding.dart';
import '../views/auth/presentation/login/loginPage.dart';
import '../views/landingPage.dart';

class Pages {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
        name: Routes.login,
        page: ()=>LoginPage(),
        // binding: AuthBinding()
    ),
    GetPage(name: Routes.registration,
        page: ()=>RegistrationPage(),
        binding: CoreBinding()
    ),

   /* GetPage(name: Routes.emailVerificationPage,
        page: ()=>EmailVerificationPage(),
        binding: AuthBinding()),*/

  /*  GetPage(name: Routes.phoneRegPage,
        page: ()=>PhoneRegistrationPage(),
        binding: AuthBinding()),*/



    GetPage(name: Routes.landingPage,
        page: ()=>LandingPage()),

/*    GetPage(name: Routes.createPinPage,
        page: ()=>CreateTransactionPin()),

*//*    GetPage(name: Routes.createThriftPlan,
        page: ()=>CreateThriftPlan(),
    binding: AuthBinding()),*//*
    GetPage(name: Routes.dashboard,
        page: ()=>DashBoardPage()),

    GetPage(name: Routes.myThriftPlan,
        page: ()=>MyThriftPlan()),

    GetPage(name: Routes.kycVerificationPage,
        page: ()=>KYCVerificationPage()),

    GetPage(name: Routes.bvnVerificationPage,
        page: ()=>BVNVerification()),

    GetPage(name: Routes.tabHostPage,
        page: ()=>TabHostPage(),
     binding: TabHostPageBindings()),


    GetPage(name: Routes.bankVerificationPage,
        page: ()=>BankVerificationPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.withdrawPage,
        page: ()=>WithdrawPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.forgottenPasswordPage,
        page: ()=>ForgottenPasswordPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.passwordResetPage,
        page: ()=>PasswordResetPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.kycPage,
        page: ()=>KYCPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.verificationPage,
        page: ()=>VerificationPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.profilePage,
        page: ()=>ProfilePage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.changePasswordPage,
        page: ()=>ChangePasswordPage(),
        binding: TabHostPageBindings()),

    GetPage(name: Routes.changeTransactionPin,
        page: ()=>ChangeTransactionPin(),
        binding: TabHostPageBindings()),

   *//* GetPage(name: Routes.transactionGenPage,
        page: ()=>TransactionGenPage(),
        binding: AuthBinding()),*//*


    GetPage(name: Routes.successRegistrationPage,
        page: ()=>SuccessRegistrationPage(),
        binding: AuthBinding()),*/

   /* GetPage(name: Routes.stepOneJoinThriftPage,
        page: ()=>SalaryRangePage(),
        binding: AuthBinding()),*/
  ] ;
}