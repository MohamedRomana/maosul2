// ignore_for_file: use_build_context_synchronously
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/util/assets_data.dart';
import 'package:maosul2/core/util/styles.dart';
import 'package:maosul2/core/widgets/app_router.dart';
import 'package:maosul2/core/widgets/flash_message.dart';
import 'package:maosul2/generated/locale_keys.g.dart';
import '../active_code/activation_pin_code_view.dart';
import 'widgets/agree_terms.dart';
import 'widgets/field.dart';
import 'widgets/image_row.dart';

final _formKey = GlobalKey<FormState>();
final _userController = TextEditingController();
final _carController = TextEditingController();
final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
String providerRegisterPhoneCode = "966";

class ProviderRegisterView extends StatelessWidget {
  const ProviderRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 100, bottom: 65, left: 58, right: 58),
                    child: Image.asset(
                      AssetsData.logo,
                      height: 87.41.h,
                    ),
                  ),
                  Text(
                    LocaleKeys.new_representative_registration.tr(),
                    style: Styles.textStyle24.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Fields(
                    formKey: _formKey,
                    carController: _carController,
                    nameController: _userController,
                    phoneController: _phoneController,
                    mailController: _emailController,
                    passController: _passwordController,
                    confirmPassController: _confirmPasswordController,
                  ),
                  const ImageRow(),
                  SizedBox(height: 27.h),
                  const AgreeTerms(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 36.h),
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is ProviderRegisterFailure) {
                          showFlashMessage(
                            message: state.error,
                            type: FlashMessageType.error,
                            context: context,
                          );
                        } else if (state is ProviderRegisterSuccess) {
                          AppRouter.navigateAndPop(
                              context, const ActivationPinCodeView());

                          AuthCubit.get(context).identityImage.clear();
                          AuthCubit.get(context).licenseImage.clear();
                          AuthCubit.get(context).carImage.clear();
                          _userController.clear();
                          _phoneController.clear();
                          _emailController.clear();
                          _carController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                          providerRegisterPhoneCode = "";
                          showFlashMessage(
                            message: state.message,
                            type: FlashMessageType.success,
                            context: context,
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (AuthCubit.get(context)
                                      .identityImage
                                      .isEmpty &&
                                  AuthCubit.get(context).licenseImage.isEmpty &&
                                  AuthCubit.get(context).carImage.isEmpty) {
                                showFlashMessage(
                                  message:
                                      LocaleKeys.image_upload_required.tr(),
                                  type: FlashMessageType.warning,
                                  context: context,
                                );
                              } else if (AuthCubit.get(context).agreeTerms ==
                                  false) {
                                showFlashMessage(
                                  message: 'agreeTermsOfUse',
                                  type: FlashMessageType.warning,
                                  context: context,
                                );
                              } else {
                                await AuthCubit.get(context)
                                    .uploadIdentityImage(
                                        identityImage: AuthCubit.get(context)
                                            .identityImage);
                                await AuthCubit.get(context).uploadLicenseImage(
                                    licenseImage:
                                        AuthCubit.get(context).licenseImage);
                                await AuthCubit.get(context).uploadCarImage(
                                    carImage: AuthCubit.get(context).carImage);
                                await AuthCubit.get(context).providerRegister(
                                    firstName: _userController.text,
                                    email: _emailController.text,
                                    phoneCode: providerRegisterPhoneCode,
                                    phone: _phoneController.text,
                                    password: _passwordController.text,
                                    carType: _carController.text == "small"
                                        ? "small"
                                        : "big");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kButtonColor,
                            minimumSize: Size(311.w, 48.h),
                          ),
                          child: state is ProviderRegisterLoading ||
                                  state is UploadImageLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  LocaleKeys.logIn.tr(),
                                  style: Styles.textStyle16,
                                ),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      LocaleKeys.iAlreadyHaveAnAccount.tr(),
                      style: Styles.textStyle18,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
