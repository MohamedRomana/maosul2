import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/order_details/widgets/order_details_container.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import '../../../../core/location/location.dart';
import '../../../../core/util/styles.dart';
import '../../../drawer/custom_drawer.dart';
import '../../../../generated/locale_keys.g.dart';
import 'widgets/client_data_container.dart';

class ProviderOrdersDetails extends StatelessWidget {
  final Map orderData;
  const ProviderOrdersDetails({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: LocaleKeys.order_details.tr(),
              widget: InkWell(
                onTap: () {
                  AppRouter.navigateTo(context, const Location());
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child:
                    Icon(Icons.location_on, color: kButtonColor, size: 27.sp),
              ),
              widget2: Container(),
            ),
          ),
          body:state is ShowProviderOrdersLoading?const Center(child: CircularProgressIndicator(color: Colors.grey,)): SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.w),
                  child: Text(
                    LocaleKeys.store_data.tr(),
                    style: Styles.textStyle18.copyWith(color: kButtonColor),
                  ),
                ),
                OrderDetailsContainer(orderDetails: orderData),
                SizedBox(height: 20.h),
                ClientDataContainer(providerData: orderData),
                Padding(
                  padding: EdgeInsets.only(top: 25.h, bottom: 40.h),
                  child: BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {
                      if (state is ChangeOrderStatusSuccess) {
                        Navigator.pop(context);
                        showFlashMessage(
                            message: state.message,
                            type: FlashMessageType.success,
                            context: context);
                      } else if (state is ChangeOrderStatusFailure) {
                        showFlashMessage(
                            message: state.error,
                            type: FlashMessageType.error,
                            context: context);
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {
                              AppCubit.get(context).changeOrderStatus(
                                  orderId: orderData["id"].toString(),
                                  status: 'agree');
                            },
                            text: LocaleKeys.accept.tr(),
                            minimumSize: Size(160.w, 48.h),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              AppCubit.get(context).changeOrderStatus(
                                  orderId: orderData["id"].toString(),
                                  status: 'refused');
                            },
                            text: LocaleKeys.reject.tr(),
                            minimumSize: Size(160.w, 48.h),
                            backgroundColor: const Color(0xffB5C4B5),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
