import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/util/styles.dart';
import '../../../languages/views/languages_view.dart';

class CustomStackButtons extends StatelessWidget {
  const CustomStackButtons({
    super.key,
    required this.onBoardingList,
    required this.currentPage,
    required PageController controller,
  }) : _controller = controller;

  final List onBoardingList;
  final int currentPage;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32.h,
      right: 0,
      left: 0,
      child: Column(
        children: [
          DotsIndicator(
            dotsCount: onBoardingList.length,
            position: currentPage,
            decorator: DotsDecorator(
              activeColor: kButtonColor,
              color: kThirdColor,
              size: Size.square(10.r),
              activeSize: Size(30.w, 10.h),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 130.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: currentPage == onBoardingList.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      AppRouter.navigateTo(context, const LanguagesView());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        elevation: 0,
                        minimumSize: Size(311.w, 48.h)),
                    child: Text(
                      'ابدأ الأن',
                      style: Styles.textStyle16,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r)),
                        backgroundColor: kButtonColor,
                        child: Text(
                          'التالي',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.animateToPage(
                            onBoardingList.length - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor, elevation: 0),
                        child: Text(
                          'تخطي',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.black),
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
