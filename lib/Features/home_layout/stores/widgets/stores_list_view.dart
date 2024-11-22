import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';
import '../../../stores_name/stores_name_view.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: AppCubit.get(context).storesList.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemBuilder: (context, index) {
            return state is GetStoresDataLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
                : InkWell(
                    onTap: () {
                      AppCubit.get(context).changeScreenIndex(index: 0);
                      AppRouter.navigateTo(
                          context,
                          StoresNameView(
                            id: AppCubit.get(context).storesList[index]["id"],
                          ));
                    },
                    child: Center(
                      child: Stack(
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
                                image: AppCubit.get(context)
                                    .storesList[index]['avatar'],
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
                                    AppCubit.get(context)
                                        .storesList[index]['rate']
                                        .toString(),
                                    style: Styles.textStyle12
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20.h,
                            right: 88.w,
                            child: Column(
                              children: [
                                Text(
                                  AppCubit.get(context).storesList[index]
                                      ['name'],
                                  style: Styles.textStyle12
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                    'سعر التوصيل: ${AppCubit.get(context).storesList[index]["delivery"]} ر.س - يبعد عنك: ${AppCubit.get(context).storesList[index]["distance"]} كم',
                                    style: Styles.textStyle10)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
