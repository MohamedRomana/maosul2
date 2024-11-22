import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/app_cache_image.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import '../../../../core/cubit/app_cubit.dart';
import '../../../../core/util/styles.dart';
import '../../../order_details/order_details_view.dart';

class CurrentOrderListView extends StatefulWidget {
  const CurrentOrderListView({super.key});

  @override
  State<CurrentOrderListView> createState() => _CurrentOrderListViewState();
}

class _CurrentOrderListViewState extends State<CurrentOrderListView> {
  @override
  initState() {
    AppCubit.get(context).showOrders(status: 'current');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: state is ShowOrdersLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                )
              : AppCubit.get(context).ordersList.isEmpty
                  ? Center(
                      child: Text(
                        'لا يوجد طلبات حاليه',
                        style: Styles.textStyle24.copyWith(color: Colors.grey),
                      ),
                    )
                  :ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  itemCount: AppCubit.get(context).ordersList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10.h),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => AppRouter.navigateTo(
                        context,
                        OrderDetailsView(
                          orderDetails: AppCubit.get(context).ordersList[index],
                        ),
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 100.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          color: kFourthColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: AppCachedImage(
                                  image: AppCubit.get(context).ordersList[index]
                                      ["provider_avatar"],
                                  height: 80.h,
                                  width: 80.w,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'رقم الطلب: ${AppCubit.get(context).ordersList[index]["id"]}',
                                    style: Styles.textStyle14
                                        .copyWith(color: kButtonColor),
                                  ),
                                  Text(
                                    'حالة الطلب: ${AppCubit.get(context).ordersList[index]["status_f"]}',
                                    style: Styles.textStyle14,
                                  ),
                                  Text(
                                    AppCubit.get(context).ordersList[index]
                                        ["provider_name"],
                                    style: Styles.textStyle10
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

// AboutDialog(),