import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_dating_app/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:social_dating_app/presentation/common_widgets/colors.dart';
import 'package:social_dating_app/presentation/common_widgets/custom_app_bar.dart';
import 'package:social_dating_app/presentation/common_widgets/custom_progress_indicator.dart';
import 'package:social_dating_app/presentation/pages/sign_in/constants/texts.dart';
import 'package:social_dating_app/presentation/pages/sign_in/widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: SignInPage());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberSignInCubit, PhoneNumberSignInState>(
      builder: (context, state) {
        return state.isInProgress
            ? BlocListener<PhoneNumberSignInCubit, PhoneNumberSignInState>(
                listenWhen: (p, c) => p.failureMessage != c.failureMessage,
                listener: (context, state) {
                  if (state.failureMessage == null) {
                  } else if (state.failureMessage != null) {
                    BotToast.showText(
                      text: state.failureMessage!.when(
                        serverError: () => "Server Error",
                        tooManyRequests: () => "Too Many Requests",
                        deviceNotSupported: () => "Device Not Supported",
                        smsTimeout: () => "Sms Timeout",
                        sessionExpired: () => "Session Expired",
                        invalidVerificationCode: () => "Invalid Verification Code",
                      ),
                    );
                    context.read<PhoneNumberSignInCubit>().reset();
                  }
                },
                child: const Scaffold(
                  body: CustomProgressIndicator(
                    progressIndicatorColor: blackColor,
                  ),
                ),
              )
            : Scaffold(
                appBar: CustomAppBar(
                  appBarIconColor: whiteColor,
                  appBarBackgroundColor: customIndigoColor,
                  appBarTitle: signInText,
                  appBarAction: CupertinoIcons.line_horizontal_3_decrease,
                ),
                body: const SignInPageBody(),
              );
      },
    );
  }
}
