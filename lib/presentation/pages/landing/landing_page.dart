import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_dating_app/application/auth/auth_cubit.dart';
import 'package:social_dating_app/presentation/pages/home/home_page_navigator.dart';
import 'package:social_dating_app/presentation/pages/sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthState>(
      state: context.select((AuthCubit cubit) => cubit.state),
      onGeneratePages: (authState, pages) {
        if (authState.isUserLoggedIn) {
          return [
            HomePageNavigator.page(),
          ];
        } else {
          return [
            SignInPage.page(),
          ];
        }
      },
    );
  }
}
