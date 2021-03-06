import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:social_dating_app/domain/user_profile/user_profile_model.dart';
import 'package:social_dating_app/presentation/common_widgets/colors.dart';
import 'package:social_dating_app/presentation/pages/profile/profile_edit/widgets/profile_edit_page_body.dart';
import 'package:social_dating_app/presentation/routes/router.gr.dart';
import 'package:social_dating_app/providers/profile/profile_provider.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({Key? key, required this.user}) : super(key: key);
  final UserProfileModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () => Future<bool>.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparentColor,
          shadowColor: transparentColor,
          foregroundColor: transparentColor,
          surfaceTintColor: transparentColor,
          toolbarHeight: 50,
          leadingWidth: 30.w,
          leading: IconButton(
            hoverColor: transparentColor,
            highlightColor: transparentColor,
            color: transparentColor,
            splashColor: transparentColor,
            focusColor: transparentColor,
            disabledColor: transparentColor,
            padding: const EdgeInsets.only(right: 45),
            onPressed: () {
              AutoRouter.of(context).replace(const RouteNavigator());
              ref.refresh(profileStateProvider);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: customIndigoColor,
              size: 40,
            ),
          ),
        ),
        body: ProfileEditPageBody(user: user),
      ),
    );
  }
}
