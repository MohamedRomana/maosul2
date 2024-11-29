import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/orders/widgets/cancelled_order_list_view.dart';
import 'package:maosul2/Features/home_layout/orders/widgets/copmeleted_order_list_view.dart';
import 'package:maosul2/Features/home_layout/orders/widgets/current_order_list_view.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/util/styles.dart';
import '../../drawer/custom_drawer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    List data = [1, 2, 3];
    return DefaultTabController(
      initialIndex: 0,
      length: data.length,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            right: 0.w,
            left: 0.w,
            title: LocaleKeys.orders.tr(),
            scaffoldKey: scaffoldKey,
            widget1: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            widget2: Container(
              color: kFourthColor,
              child: TabBar(
                onTap: (value) {},
                labelColor: Colors.white,
                labelStyle: Styles.textStyle12,
                indicatorColor: kButtonColor,
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.symmetric(horizontal: -20.w),
                indicator: const BoxDecoration(
                  color: kButtonColor,
                ),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: LocaleKeys.currentrequests.tr()),
                  Tab(text: LocaleKeys.completedrequests.tr()),
                  Tab(text: LocaleKeys.canceledrequests.tr()),
                ],
              ),
            ),
          ),
        ),
        body: 
           const TabBarView(
            children: [
              CurrentOrderListView(),
              CopmeletedOrderListView(),
              CancelledOrderListView(),
            ],
          ),
        
      ),
    );
  }
}
