import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/custom_bottom_nav.dart';
import 'package:maosul2/core/widgets/custom_drawer.dart';
import '../../generated/locale_keys.g.dart';
import 'widgets/order_details_container.dart';
import 'widgets/order_note_container.dart';
import 'widgets/order_price.dart';
import 'widgets/order_status_container.dart';

class OrderDetailsView extends StatelessWidget {
  final Map orderDetails;
  const OrderDetailsView({super.key, required this.orderDetails});

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
            preferredSize: Size.fromHeight(115.h),
            child: CustomAppBar(
                scaffoldKey: scaffoldKey,
                title: LocaleKeys.order_details.tr(),
                widget2: Container()),
          ),
          body: state is ShowOrdersLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.grey,))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      OrderPrice(
                        orderDetails: orderDetails["order_services"],
                      ),
                      OrderDetailsContainer(orderDetails: orderDetails),
                      OrderNoteContainer(
                        orderDetails: orderDetails,
                      ),
                      OrderStatusContainer(
                        orderDetails: orderDetails,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
