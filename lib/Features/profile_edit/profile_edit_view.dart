import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../core/util/styles.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../drawer/custom_drawer.dart';
import '../../core/widgets/custom_text_field.dart';

final _nameController = TextEditingController();
final _mailController = TextEditingController();
final _phoneController = TextEditingController();

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

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
              title: LocaleKeys.editaccount.tr(),
              scaffoldKey: scaffoldKey,
              widget2: Container(),
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(),
          body: state is ShowUserLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                ))
              : Column(
                  children: [
                    CustomTextField(
                      fillColor: kFourthColor,
                      focusedColor: kButtonColor,
                      enabledColor: kButtonColor,
                      controller: _nameController,
                      horizontal: 20,
                      vertical: 8,
                      hintText: AppCubit.get(context).userInfo["first_name"],
                      hintStyle:
                          Styles.textStyle14.copyWith(color: Colors.black),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    CustomTextField(
                      fillColor: kFourthColor,
                      focusedColor: kButtonColor,
                      enabledColor: kButtonColor,
                      controller: _mailController,
                      keyboardType: TextInputType.emailAddress,
                      horizontal: 20,
                      vertical: 8,
                      hintText: AppCubit.get(context).userInfo["email"] == ""
                          ? LocaleKeys.email.tr()
                          : AppCubit.get(context).userInfo["email"],
                      hintStyle: Styles.textStyle14.copyWith(
                        color: AppCubit.get(context).userInfo["email"] == ""
                            ? Colors.grey
                            : Colors.black,
                      ),
                      prefixIcon: const Icon(Icons.mail),
                    ),
                    CustomTextField(
                      fillColor: kFourthColor,
                      focusedColor: kButtonColor,
                      enabledColor: kButtonColor,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      horizontal: 20,
                      vertical: 8,
                      hintText:
                          '+${AppCubit.get(context).userInfo["full_phone"]}',
                      hintStyle:
                          Styles.textStyle14.copyWith(color: Colors.black),
                      prefixIcon: const Icon(Icons.phone_in_talk),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        boxShadow: [
                          BoxShadow(
                            color: kButtonColor.withOpacity(0.5),
                            blurRadius: 10.r,
                            offset: const Offset(7, 7),
                          )
                        ],
                      ),
                      child: BlocConsumer<AppCubit, AppState>(
                        listener: (context, state) {
                          if (state is UpdateProfileSuccess) {
                            Navigator.pop(context);
                            showFlashMessage(
                                message: state.message,
                                type: FlashMessageType.success,
                                context: context);
                            _nameController.clear();
                            _mailController.clear();
                            _phoneController.clear();
                          } else if (state is UpdateProfileFailure) {
                            showFlashMessage(
                                message: state.error,
                                type: FlashMessageType.error,
                                context: context);
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              AppCubit.get(context).updateProfile(
                                  firstName: _nameController.text.isEmpty
                                      ? AppCubit.get(context)
                                          .userInfo["first_name"]
                                      : _nameController.text,
                                  phone: _phoneController.text.isEmpty
                                      ? AppCubit.get(context)
                                          .userInfo["full_phone"]
                                      : _phoneController.text,
                                  email: _mailController.text.isEmpty
                                      ? AppCubit.get(context).userInfo["email"]
                                      : _mailController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonColor,
                              minimumSize: Size(311.w, 48.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            child: state is UpdateProfileLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    LocaleKeys.save.tr(),
                                    style: Styles.textStyle16,
                                  ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
