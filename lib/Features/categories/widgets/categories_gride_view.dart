import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/styles.dart';
import '../../home_layout/home_layout.dart';

class CategoriesGrideView extends StatelessWidget {
  const CategoriesGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return  GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                itemCount: AppCubit.get(context).sections.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      AppCubit.get(context).changeScreenIndex(index: 0);
                      AppCubit.get(context).storessData(
                        sectionId: AppCubit.get(context)
                            .sections[index]['id']
                            .toString(),
                      );
                      AppRouter.navigateAndFinish(context, const HomeLayout());
                    },
                    child: Container(
                      height: 80.h,
                      width: 110.w,
                      margin: EdgeInsets.symmetric(
                          horizontal: 3.5.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F9F4),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppCachedImage(
                            image: AppCubit.get(context).sections[index]
                                ['image'],
                            height: 42.h,
                            width: 42.w,
                          ),
                          Text(
                            AppCubit.get(context).sections[index]['title'],
                            style: Styles.textStyle12
                                .copyWith(color: const Color(0xff293462)),
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
