import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/home_layout/home_layout.dart';
import 'package:maosul2/Features/provider_screens/provider_orders/provider_orders_view.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_text_field.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/util/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_nav.dart';
import '../custom_drawer.dart';

final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _messageController = TextEditingController();

class CallUsView extends StatelessWidget {
  const CallUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      bottomNavigationBar: CacheHelper.getUserType() == "client"
          ? const CustomBottomNav()
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          title: LocaleKeys.callus.tr(),
          widget2: Container(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.name.tr(),
                      style: Styles.textStyle16.copyWith(color: kButtonColor),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField(
                      hintText: LocaleKeys.full_name.tr(),
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.username_required.tr();
                        }
                        return null;
                      },
                      focusedColor: kButtonColor,
                      enabledColor: Colors.grey,
                      horizontal: 1,
                      vertical: 8,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.email.tr(),
                      style: Styles.textStyle16.copyWith(color: kButtonColor),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField(
                      hintText: LocaleKeys.enter_email.tr(),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.required_email.tr();
                        }
                        return null;
                      },
                      focusedColor: kButtonColor,
                      enabledColor: Colors.grey,
                      horizontal: 1,
                      vertical: 8,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.message_text.tr(),
                      style: Styles.textStyle16.copyWith(color: kButtonColor),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField(
                      hintText: LocaleKeys.your_message.tr(),
                      controller: _messageController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.required_message.tr() ;
                        }
                        return null;
                      },
                      focusedColor: kButtonColor,
                      enabledColor: Colors.grey,
                      maxLines: 5,
                      horizontal: 1,
                      vertical: 10,
                      borderRadius: BorderRadius.circular(10.r),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {
                    if (state is ContactUsSuccess) {
                      AppCubit.get(context).changeScreenIndex(index: 2);
                      AppRouter.navigateAndFinish(
                          context,
                          CacheHelper.getUserType() == "client"
                              ? const HomeLayout()
                              : const ProviderOrderView());
                      _nameController.clear();
                      _emailController.clear();
                      _messageController.clear();
                      showFlashMessage(
                          message: state.message,
                          type: FlashMessageType.success,
                          context: context);
                    } else if (state is ContactUsFailure) {
                      showFlashMessage(
                          message: state.error,
                          type: FlashMessageType.error,
                          context: context);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await AppCubit.get(context).contactUs(
                            name: _nameController.text,
                            email: _emailController.text,
                            message: _messageController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(311.w, 48.h),
                          backgroundColor: kButtonColor),
                      child: state is ContactUsLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              LocaleKeys.send.tr(),
                              style: Styles.textStyle16,
                            ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
