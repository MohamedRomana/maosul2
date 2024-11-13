import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../../core/util/styles.dart';

class CategoryNameListView extends StatelessWidget {
  const CategoryNameListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      child: Stack(
        children: [
          SizedBox(
            height: 30.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30.h,
                    width: 69.w,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'اسم القسم',
                        style: Styles.textStyle12,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 30.h,
            width: 69.w,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(5.r)),
            child: Center(
              child: Text(
                'الاكثر مبيعا',
                style: Styles.textStyle12.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
