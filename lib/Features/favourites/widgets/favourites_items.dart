import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class FavouritesItems extends StatelessWidget {
  const FavouritesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 222.h,
          width: 165.w,
          decoration: BoxDecoration(
            color: kFourthColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                child: Image.asset(
                  'assets/images/pexels-ella-olsson-572949-1640772.jpg',
                  fit: BoxFit.cover,
                  height: 150.h,
                  width: 165.w,
                ),
              ),
              Positioned(
                right: -10.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: const CircleBorder(),
                    minimumSize: Size(30.w, 30.h),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 5.w),
                        child: Text(
                          'اسم المنتج',
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '‏75ر.س',
                            style: Styles.textStyle12,
                          ),
                          SizedBox(
                            width: 61.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffF9BF00),
                                  size: 20.5,
                                ),
                                SizedBox(width: 2.5.w),
                                Text(
                                  '3.9',
                                  style: Styles.textStyle12
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
