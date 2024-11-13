import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';

class AddCartListView extends StatelessWidget {
  const AddCartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 80.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 60.h,
                                      child: CircleAvatar(
                                        radius: 50.r,
                                        backgroundImage: const AssetImage(
                                            'assets/images/images.jpeg'),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'اسم المنتج',
                                          style: Styles.textStyle12.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 11.w),
                                        Text(
                                          '‏75ر.س',
                                          style: Styles.textStyle12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            AppCubit.get(context).increseCount();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(30.w, 30.w),
                                              shape: const CircleBorder(),
                                              backgroundColor: kButtonColor,
                                              iconColor: Colors.white,
                                              elevation: 0),
                                          child: Icon(
                                            Icons.add,
                                            size: 15.sp,
                                          ),
                                        ),
                                        Container(
                                          width: 47.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          child: Center(
                                            child: Text(
                                              AppCubit.get(context)
                                                  .count
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                           AppCubit.get(context).decreseCount();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size(30.w, 30.w),
                                              shape: const CircleBorder(),
                                              backgroundColor: kThirdColor,
                                              iconColor: Colors.white,
                                              elevation: 0),
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            size: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: -10.h,
                                  left: 0.w,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.close,
                                      size: 12.sp,
                                      color: const Color(0xffEF0404),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}
