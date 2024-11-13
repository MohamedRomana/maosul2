import 'package:flutter/material.dart';
import 'package:maosul2/Features/start/on_boarding/views/widgets/on_boarding_view_body.dart';
import 'package:maosul2/core/constants.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: OnBoardingViewBody(),
    );
  }
}
