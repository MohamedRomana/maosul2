import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../core/widgets/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: const CustomBottomNav(),
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              title: LocaleKeys.notifications.tr(),
              scaffoldKey: scaffoldKey,
              widget2: Container(),
            ),
          ),
          body: AppCubit.get(context).showNotification.isEmpty
              ? Center(
                  child: Text(
                    'لا يوجد اشعارات',
                    style: Styles.textStyle24.copyWith(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: AppCubit.get(context).showNotification.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                AppCubit.get(context).deleteNotificationData(
                                    id: AppCubit.get(context)
                                        .showNotification[index]["id"],
                                    index: index);
                              },
                              backgroundColor: kPrimaryColor,
                              foregroundColor: kButtonColor,
                              icon: Icons.done,
                              label: 'حذف',
                            ),
                          ],
                        ),
                        child: Container(
                          height: 64.h,
                          width: 343.w,
                          color: index.isEven ? Colors.white : kFourthColor,
                          child: Column(
                            children: [
                              SizedBox(height: 13.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: kButtonColor,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppCubit.get(context)
                                            .showNotification[index]["message"],
                                        style: Styles.textStyle14,
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                          AppCubit.get(context)
                                                  .showNotification[index]
                                              ["duration"],
                                          style: Styles.textStyle12),
                                    ],
                                  ),
                                ],
                              ),
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
