import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/util/styles.dart';
import 'custom_stack_buttons.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;
  List onBoardingList = [
    {
      "image": 'assets/images/Group 10837.png',
      "title": 'عنوان تجريبي',
      "body":
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص',
    },
    {
      "image": 'assets/images/Group 10835.png',
      "title": 'عنوان تجريبي',
      "body":
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص',
    },
    {
      "image": 'assets/images/Group 10836.png',
      "title": 'عنوان تجريبي',
      "body":
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          onPageChanged: (page) {
            currentPage = page;
            setState(() {});
          },
          scrollDirection: Axis.horizontal,
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 128.3.h),
                  child: Image.asset(
                    onBoardingList[index]['image'],
                    height: 285.88.h,
                  ),
                ),
                Text(
                  onBoardingList[index]['title'],
                  style: Styles.textStyle24,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 17.h),
                  child: SizedBox(
                    width: 300.w,
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      onBoardingList[index]['body'],
                      style: Styles.textStyle14,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        CustomStackButtons(
          onBoardingList: onBoardingList,
          currentPage: currentPage,
          controller: _controller,
        ),
      ],
    );
  }
}
