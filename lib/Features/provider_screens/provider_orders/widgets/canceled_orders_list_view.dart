import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';
import '../orders_details/provider_orders_details.dart';

class CanceledOrdersListView extends StatefulWidget {
  const CanceledOrdersListView({
    super.key,
  });

  @override
  State<CanceledOrdersListView> createState() => _CanceledOrdersListViewState();
}

class _CanceledOrdersListViewState extends State<CanceledOrdersListView> {
  @override
  void initState() {
    AppCubit.get(context).showProviderOrders(status: 'refused');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: state is ShowProviderOrdersLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.grey))
              : AppCubit.get(context).providerOrdersList.isEmpty
                  ? Center(
                      child: Text(
                      'لا يوجد طلبات ملغيه',
                      style: Styles.textStyle24.copyWith(color: Colors.grey),
                    ))
                  : ListView.builder(
                      itemCount:
                          AppCubit.get(context).providerOrdersList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => AppRouter.navigateTo(
                            context,  ProviderOrdersDetails(orderData: AppCubit.get(context).providerOrdersList[index],)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 24.h, horizontal: 16.w),
                          child: Container(
                            height: 122.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              color: kFourthColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        color: kButtonColor,
                                        size: 25.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 12.w, end: 90.w),
                                        child: Text(
                                          AppCubit.get(context)
                                                  .providerOrdersList[index]
                                              ['user_name'],
                                          style: Styles.textStyle14
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        'رقم الطلب :  ${AppCubit.get(context).providerOrdersList[index]['id']}',
                                        style: Styles.textStyle14
                                            .copyWith(color: kButtonColor),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.edit_location,
                                        color: kButtonColor,
                                        size: 25.sp,
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        AppCubit.get(context)
                                                .providerOrdersList[index]
                                            ['user_address'],
                                        style: Styles.textStyle14
                                            .copyWith(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/ic_history_24px.svg',
                                        height: 20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 12.w, end: 120.w),
                                        child: Text(
                                          '${AppCubit.get(context).providerOrdersList[index]['provider_delivery_time']} دقيقة',
                                          style: Styles.textStyle14
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ),
                                      Text(
                                        AppCubit.get(context)
                                                .providerOrdersList[index]
                                            ['status_f'],
                                        style: Styles.textStyle14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
