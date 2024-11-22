import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/app_cache_image.dart';

class ImageDetailsStack extends StatelessWidget {
  const ImageDetailsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return state is GetStoresDataLoading
            ? Container(
                height: 150.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.grey, color: kButtonColor)))
            : Stack(
                children: [
                  Container(
                    height: 150.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: AppCachedImage(
                        image: AppCubit.get(context).storeData["avatar"] ?? "",
                        fit: BoxFit.fill,
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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              AppCubit.get(context)
                                  .storeData['rate']
                                  .toString(),
                              style: Styles.textStyle12
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    left: 20.w,
                    child: Column(
                      children: [
                        Text(
                          AppCubit.get(context).storeData['name'] ?? "",
                          style:
                              Styles.textStyle12.copyWith(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/svg/ic_my_location_24px.svg'),
                            Text(
                              'يبعد ${AppCubit.get(context).storeData['distance']} كم',
                              style: Styles.textStyle10,
                            ),
                            SvgPicture.asset(
                                'assets/svg/ic_watch_later_24px.svg'),
                            Text(
                              'وقت التوصيل : ${AppCubit.get(context).storeData['delivery_time']} د',
                              style: Styles.textStyle10,
                            ),
                            SvgPicture.asset('assets/svg/Path 3387.svg'),
                            Text(
                              'التوصيل : ${AppCubit.get(context).storeData['delivery']} ر.س',
                              style: Styles.textStyle10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
