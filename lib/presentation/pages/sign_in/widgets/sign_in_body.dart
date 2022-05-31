import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_dating_app/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:social_dating_app/presentation/pages/sign_in/widgets/bottom_section_of_the_page.dart';
import 'package:social_dating_app/presentation/pages/sign_in/widgets/top_section_of_the_page.dart';

class SignInPageBody extends StatelessWidget {
  const SignInPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<PhoneNumberSignInCubit, PhoneNumberSignInState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            ...topSectionOfThePage(size: size),
            BottomSectionOfThePage(size: size),
          ],
        );
      },
    );
  }
}
