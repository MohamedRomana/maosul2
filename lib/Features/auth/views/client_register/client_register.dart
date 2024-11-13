import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/assets_data.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../../../../core/widgets/flash_message.dart';
import '../active_code/activation_pin_code_view.dart';
import 'widgets/custom_client_register.dart';

final _formKey = GlobalKey<FormState>();
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _mailController = TextEditingController();
final locationController = TextEditingController();
final _passController = TextEditingController();
final _confirmPassController = TextEditingController();
String userRegisterPhoneCode = "966";

class ClientRegister extends StatelessWidget {
  const ClientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AppRouter.navigateTo(context, const ActivationPinCodeView());
          _nameController.clear();
          _phoneController.clear();
          _mailController.clear();
          locationController.clear();
          _passController.clear();
          _confirmPassController.clear();
          userRegisterPhoneCode = "";
          showFlashMessage(
            context: context,
            type: FlashMessageType.success,
            message: state.message,
          );
        } else if (state is RegisterFailure) {
          showFlashMessage(
            context: context,
            type: FlashMessageType.error,
            message: state.error,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h, bottom: 68.h),
                      child: Image.asset(
                        AssetsData.logo,
                        height: 87.41.h,
                      ),
                    ),
                    Text(
                      LocaleKeys.registerANewUser.tr(),
                      style: Styles.textStyle24.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomClientRegister(
                      nameController: _nameController,
                      phoneController: _phoneController,
                      mailController: _mailController,
                      locationController: locationController,
                      passController: _passController,
                      confirmPassController: _confirmPassController,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 36.h),
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthCubit.get(context).register(
                              userType: AppCubit.get(context).typeIndex == 0
                                  ? "client"
                                  : "provider",
                              firstName: _nameController.text,
                              phoneCode: userRegisterPhoneCode,
                              phone: _phoneController.text,
                              mail: _mailController.text,
                              password: _passController.text,
                              address: AppCubit.get(context).address ?? "",
                              lat: AppCubit.get(context).lat.toString(),
                              lng: AppCubit.get(context).lng.toString(),
                            );
                          }
                          // GoRouter.of(context).push(AppRouters.kActivationcode);
                        },
                        child: state is RegisterLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : Text(
                                LocaleKeys.register.tr(),
                                style: Styles.textStyle16,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        LocaleKeys.iAlreadyHaveAnAccount.tr(),
                        style: Styles.textStyle18,
                      ),
                    ),
                    SizedBox(
                      height: 37.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
