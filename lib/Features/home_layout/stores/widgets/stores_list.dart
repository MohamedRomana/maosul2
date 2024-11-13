import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/styles.dart';
import 'product-rating.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/image-186405-types-varieties-different-goods-luxury-stores-malls-kingd-preview.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: 343.w,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.61),
                borderRadius: BorderRadius.circular(10.r)),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: const ProductRating(),
          ),
          Positioned(
            bottom: 20.h,
            right: 88.w,
            child: Column(
              children: [
                Text(
                  'اسم المتجر',
                  style: Styles.textStyle12.copyWith(color: Colors.white),
                ),
                Text('سعر التوصيل: 10ر.س - يبعد عنك: 5 كم',
                    style: Styles.textStyle10)
              ],
            ),
          )
        ],
      ),
    );
  }
}

