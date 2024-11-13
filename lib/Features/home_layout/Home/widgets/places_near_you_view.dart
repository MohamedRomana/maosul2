import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';

class PlacesNearYou extends StatelessWidget {
  const PlacesNearYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.asset(
            'assets/images/image-186405-types-varieties-different-goods-luxury-stores-malls-kingd-preview.jpg',
            width: 200.w,
            height: 120.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            width: 200.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: kButtonColor.withOpacity(0.36),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'اسم المتجر',
                      style: Styles.textStyle12.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 92.w,
                    ),
                    Row(
                      children: [
                        const Text(
                          '4.9',
                          style: TextStyle(
                              color: Color(
                                0xffFC6011,
                              ),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 4.2.w),
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          color: Color(
                            0xffFC6011,
                          ),
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'حي الصحافة - ش الملك سعود',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
