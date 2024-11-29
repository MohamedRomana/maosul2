import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/Features/drawer/custom_drawer.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/util/styles.dart';
import 'widgets/canceled_orders_list_view.dart';
import 'widgets/completed_orders_list_view.dart';
import 'widgets/current_orders_tab_list_view.dart';

class ProviderOrderView extends StatelessWidget {
  const ProviderOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            scaffoldKey: scaffoldKey,
            title: LocaleKeys.orders.tr(),
            widget: Container(),
            widget1: Container(),
            right: 0.w,
            left: 0.w,
            widget2: Container(
              height: 40.h,
              decoration: const BoxDecoration(color: kFourthColor),
              child: TabBar(
                labelColor: Colors.white,
                labelStyle: Styles.textStyle12,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                indicatorPadding: EdgeInsets.symmetric(horizontal: -20.w),
                indicator: const BoxDecoration(
                  color: kButtonColor,
                ),
                tabs:  [
                  Tab(text: LocaleKeys.currentrequests.tr()),
                  Tab(text: LocaleKeys.completedrequests.tr()),
                  Tab(text: LocaleKeys.canceledrequests.tr()),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CurrentOrdersTabListView(),
            CompletedOrdersListView(),
            CanceledOrdersListView(),
          ],
        ),
      ),
    );
  }
}




