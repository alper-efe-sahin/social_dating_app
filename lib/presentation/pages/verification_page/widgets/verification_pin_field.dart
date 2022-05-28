import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:social_dating_app/application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart';
import 'package:social_dating_app/presentation/common_widgets/colors.dart';

class VerificationPinField extends StatelessWidget {
  const VerificationPinField({Key? key, required this.state}) : super(key: key);

  final PhoneNumberSignInState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.15,
            height: MediaQuery.of(context).size.height / 9,
            decoration: BoxDecoration(
              border: Border.all(color: whiteColor, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          PinCodeTextField(
            backgroundColor: transparentColor,
            mainAxisAlignment: MainAxisAlignment.center,
            appContext: context,
            length: 6,
            onChanged: (String smsCode) {
              context.read<PhoneNumberSignInCubit>().smsCodeChanged(smsCode: smsCode);
            },
            textStyle: const TextStyle(color: whiteColor),
            keyboardType: TextInputType.phone,
            hintCharacter: "-",
            hintStyle: const TextStyle(color: whiteColor),
            pinTheme: PinTheme(
                fieldOuterPadding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 60,
                fieldWidth: 45,
                inactiveColor: customIndigoBackgroundColor,
                activeColor: customIndigoBackgroundColor,
                selectedColor: customIndigoBackgroundColor),
          ),
        ],
      ),
    );
  }
}
