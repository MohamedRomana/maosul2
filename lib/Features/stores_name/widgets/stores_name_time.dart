import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maosul2/Features/home_layout/stores/widgets/product-rating.dart';
import '../../../core/util/styles.dart';

class StoresNameTime extends StatelessWidget {
  const StoresNameTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(top: 10.h, right: 10.w, child: const ProductRating()),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          left: 20.w,
          child: Column(
            children: [
              Text(
                'اسم المتجر',
                style: Styles.textStyle12.copyWith(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/ic_my_location_24px.svg'),
                  Text(
                    'يبعد 2.5 كم',
                    style: Styles.textStyle10,
                  ),
                  SvgPicture.asset('assets/svg/ic_watch_later_24px.svg'),
                  Text(
                    'وقت التوصيل : 10-20 د',
                    style: Styles.textStyle10,
                  ),
                  SvgPicture.asset('assets/svg/Path 3387.svg'),
                  Text(
                    'التوصيل : 12 ر.س',
                    style: Styles.textStyle10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
