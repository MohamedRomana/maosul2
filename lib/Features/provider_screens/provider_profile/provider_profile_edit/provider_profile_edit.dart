import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/provider_profile_edit/widget/edit_image_row.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import '../../../../core/constants.dart';
import '../../../../core/util/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/locale_keys.g.dart';

final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _phoneController = TextEditingController();

class ProviderProfileEdit extends StatelessWidget {
  final Map userInfo;
  const ProviderProfileEdit({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(115.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: 'تعديل البيانات',
              widget2: Container(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  fillColor: kFourthColor,
                  focusedColor: kButtonColor,
                  enabledColor: kButtonColor,
                  controller: _nameController,
                  horizontal: 20,
                  vertical: 8,
                  hintText: userInfo["first_name"],
                  hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
                  prefixIcon: const Icon(Icons.person),
                ),
                CustomTextField(
                  fillColor: kFourthColor,
                  focusedColor: kButtonColor,
                  enabledColor: kButtonColor,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  horizontal: 20,
                  vertical: 8,
                  hintText: userInfo["email"],
                  hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
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
                  hintText: userInfo['full_phone'],
                  hintStyle: Styles.textStyle14.copyWith(color: Colors.black),
                  prefixIcon: const Icon(Icons.phone_in_talk),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: EditImageRow(
                    userInfo: userInfo,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    boxShadow: [
                      BoxShadow(
                        color: kButtonColor.withOpacity(0.5),
                        blurRadius: 10.r,
                        offset: const Offset(7, 7),
                      ),
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
                        _emailController.clear();
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
                            firstName: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          minimumSize: Size(343.w, 50.h),
                        ),
                        child: state is UpdateProfileLoading ? const CircularProgressIndicator(color: Colors.white,) : Text(
                          LocaleKeys.save.tr(),
                          style: Styles.textStyle16,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
