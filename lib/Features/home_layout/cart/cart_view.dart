import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/cart/widgets/add_cart_list_view.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/observation_text_field.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/choose_address.dart';
import 'widgets/choose_payment.dart';
import 'widgets/total_container.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: CustomAppBar(
          title: LocaleKeys.cart.tr(),
          scaffoldKey: scaffoldKey,
          widget2: const Text(''),
          widget1: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AddCartListView(),
                SizedBox(height: 10.h),
                const ObservationTextField(),
                SizedBox(height: 19.h),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TotalContainer(),
                      const ChoosePayment(),
                      const ChooseAddress(),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        children: [
                          CustomElevatedButton(
                            onPressed: () {},
                            text: LocaleKeys.processorder.tr(),
                            minimumSize: Size(165.w, 48.h),
                          ),
                          SizedBox(width: 10.w),
                          CustomElevatedButton(
                            onPressed: () {
                              AppCubit.get(context).changeScreenIndex(index: 0);
                            },
                            text: LocaleKeys.cancelorder.tr(),
                            style:
                                Styles.textStyle16.copyWith(color: Colors.grey),
                            minimumSize: Size(165.w, 48.h),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
