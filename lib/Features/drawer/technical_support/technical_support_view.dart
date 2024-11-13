import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../../../core/widgets/custom_drawer.dart';

class TechnicalSupportView extends StatelessWidget {
  const TechnicalSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      bottomNavigationBar:
          AppCubit.get(context).typeIndex == 0 ? const CustomBottomNav() : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(535.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.technicalsupport.tr(),
          widget2: Container(
            height: 535.h,
            width: 342.w,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Container(
                  height: 100.h,
                  width: 342.w,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      'يرجى تعبئه النموذج بشكل صحيح و ادخال بيانات\n صحيحه لكي يتم التواصل معكم',
                      style: Styles.textStyle14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.h,
                  right: 20.w,
                  left: 20.w,
                  child: Container(
                    height: 350.h,
                    width: 270.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.blue,
                          blurRadius: 0,
                          offset: Offset(-9, 0),
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          enabledColor: Colors.grey,
                          focusedColor: Colors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          horizontal: 12.w,
                          hintText: '*الاسم',
                        ),
                        CustomTextField(
                          enabledColor: Colors.grey,
                          focusedColor: Colors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          horizontal: 12.w,
                          hintText: '*البريد الالكتروني',
                        ),
                        CustomTextField(
                          enabledColor: Colors.grey,
                          focusedColor: Colors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          horizontal: 12.w,
                          hintText: '*رقم الهاتف ( يفضل يكون عليه واتس )',
                        ),
                        CustomTextField(
                          enabledColor: Colors.grey,
                          focusedColor: Colors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          horizontal: 12.w,
                          hintText: '*رسالتك والوقت المفضل لك لنتواصل معك فيه',
                          maxLines: 3,
                        ),
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 48.h,
                            width: 280.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'ارسال',
                                  style: Styles.textStyle16
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
