import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class ProviderImages extends StatelessWidget {
  const ProviderImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'صورة الهوية',
              style: Styles.textStyle14.copyWith(color: kButtonColor),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Mask Group 2198.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'صورة الرخصة',
              style: Styles.textStyle14.copyWith(color: kButtonColor),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Mask Group 2198.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'صورة السيارة',
              style: Styles.textStyle14.copyWith(color: kButtonColor),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Mask Group 2198.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
