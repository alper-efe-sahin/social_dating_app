import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_dating_app/application/auth/auth_state.dart';
import 'package:social_dating_app/presentation/common_widgets/colors.dart';
import 'package:social_dating_app/presentation/common_widgets/custom_progress_indicator.dart';
import 'package:social_dating_app/presentation/routes/router.gr.dart';
import 'package:social_dating_app/providers/auth/auth_state_provider.dart';
import 'package:social_dating_app/providers/profile/profile_provider.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final user = ref.read(authStateProvider.notifier).appInit();
        if (user == null) {
          AutoRouter.of(context).replace(const SignInRoute());
        } else {
          ref.read(profileStateProvider.notifier).getCurrentUser();
          AutoRouter.of(context).replace(const HomeLandingRoute());
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(
      authStateProvider,
      (p, c) {
        if (c.isUserSignedIn) {
          ref.read(profileStateProvider.notifier).getCurrentUser();
          AutoRouter.of(context).replace(const HomeLandingRoute());
        } else if (!c.isUserSignedIn) {
          AutoRouter.of(context).replace(const SignInRoute());
        }
      },
    );
    return const Scaffold(
      body: CustomProgressIndicator(
        progressIndicatorColor: blackColor,
      ),
    );
  }
}
