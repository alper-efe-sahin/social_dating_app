// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:social_dating_app/presentation/pages/home/home_page_navigator.dart';
import 'package:social_dating_app/presentation/pages/home/widgets/home_page_body.dart';
import 'package:social_dating_app/presentation/pages/landing/landing_page.dart';
import 'package:social_dating_app/presentation/pages/sign_in/sign_in_page.dart';
import 'package:social_dating_app/presentation/pages/verification_page/sign_in_verification_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(
      page: SignInVerificationPage,
    ),
    AutoRoute(
      page: HomePageNavigator,
    ),
    AutoRoute(
      page: HomePageBody,
    ),
    AutoRoute(
      page: LandingPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
