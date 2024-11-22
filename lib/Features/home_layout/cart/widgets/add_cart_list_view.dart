import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';

class AddCartListView extends StatelessWidget {
  final List cartList;
  const AddCartListView({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: cartList.length,
          itemBuilder: (context, int index) {
            return SingleChildScrollView(
              child: Padding(
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
                                    Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: SizedBox(
                                        height: 60.h,
                                        width: 60.w,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            child: AppCachedImage(
                                                image: cartList[index]
                                                        ["first_image"] ??
                                                    "")),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          cartList[index]["service_title"]
                                              .toString(),
                                          style: Styles.textStyle12.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 11.w),
                                        Text(
                                          '${cartList[index]["total_with_value"]}.رس',
                                          style: Styles.textStyle12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 60.w),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            AppCubit.get(context)
                                                .changeCartIndex(index: index);
                                            AppCubit.get(context).updateCart(
                                              cartId: cartList[index]["id"]
                                                  .toString(),
                                              count:
                                                  (cartList[index]["count"] + 1)
                                                      .toString(),
                                            );
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
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              cartList[index]["count"]
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            AppCubit.get(context)
                                                .changeCartIndex(index: index);
                                            AppCubit.get(context).updateCart(
                                              cartId: cartList[index]["id"]
                                                  .toString(),
                                              count:
                                                  (cartList[index]["count"] - 1)
                                                      .toString(),
                                            );
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
                                    onPressed: () {
                                      AppCubit.get(context)
                                          .changeCartIndex(index: index);
                                      AppCubit.get(context).updateCart(
                                          cartId:
                                              cartList[index]["id"].toString(),
                                          count: 0.toString());
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15.sp,
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
                ),
              ),
            );
          },
        );
      },
    );
  }
}
