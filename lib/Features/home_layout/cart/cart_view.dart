import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/cart/widgets/add_cart_list_view.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import '../../../core/cache/cache_helper.dart';
import '../../drawer/custom_drawer.dart';
import '../../../core/widgets/flash_message.dart';
import '../../../core/widgets/login_first.dart';
import '../../../core/widgets/observation_text_field.dart';
import '../../../generated/locale_keys.g.dart';
import 'widgets/cart_empty.dart';
import 'widgets/choose_address.dart';
import 'widgets/choose_payment.dart';
import 'widgets/total_container.dart';

final _notesController = TextEditingController();

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  initState() {
    super.initState();
    if (CacheHelper.getUserId() != "") {
      AppCubit.get(context).showCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: CustomAppBar(
          title: LocaleKeys.cart.tr(),
          scaffoldKey: scaffoldKey,
          widget2: const Text(''),
          widget1: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is ShowCartSuccess) {
            AppCubit.get(context).cartCount = 0;
          } else if (state is ShowCartFailure) {
            showFlashMessage(
              context: context,
              type: FlashMessageType.error,
              message: state.error,
            );
          } else if (state is StoreOrderSuccess) {
            AppCubit.get(context).changeScreenIndex(index: 2);
            showFlashMessage(
              context: context,
              type: FlashMessageType.success,
              message: state.message,
            );
          } else if (state is StoreOrderFailure) {
            showFlashMessage(
              context: context,
              type: FlashMessageType.error,
              message: state.error,
            );
          }
        },
        builder: (context, state) {
          return CacheHelper.getUserId() == ""
              ? const LoginFirst()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: state is ShowCartLoading &&
                          AppCubit.get(context).cartList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        )
                      : AppCubit.get(context).cartList.isEmpty
                          ? const Center(child: CartEmpty())
                          : Column(
                              children: [
                                AddCartListView(
                                    cartList: AppCubit.get(context).cartList),
                                SizedBox(height: 10.h),
                                ObservationTextField(
                                    notesController: _notesController),
                                SizedBox(height: 19.h),
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TotalContainer(
                                          cartDetailes: AppCubit.get(context)
                                              .cartDetailes),
                                      const ChoosePayment(),
                                      const ChooseAddress(),
                                      SizedBox(height: 23.h),
                                      Row(
                                        children: [
                                          CustomElevatedButton(
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .storeOrder();
                                            },
                                            text: LocaleKeys.processorder.tr(),
                                            minimumSize: Size(165.w, 48.h),
                                          ),
                                          SizedBox(width: 10.w),
                                          CustomElevatedButton(
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeScreenIndex(index: 0);
                                            },
                                            text: LocaleKeys.addorder.tr(),
                                            style: Styles.textStyle16
                                                .copyWith(color: Colors.grey),
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
