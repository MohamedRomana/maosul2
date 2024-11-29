import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ProviderDetails extends StatefulWidget {
  const ProviderDetails({super.key});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Center(
          child: Container(
            width: 343.w,
            decoration: BoxDecoration(
              color: kFourthColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                    horizontal: 10,
                    vertical: 5,
                    hintText: AppCubit.get(context).userInfo["first_name"],
                    prefixIcon: const Icon(Icons.person),
                    enabled: false,
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  Visibility(
                    visible: AppCubit.get(context).userInfo["email"] == ""
                        ? false
                        : true,
                    child: CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      horizontal: 10,
                      vertical: 5,
                      hintText: AppCubit.get(context).userInfo["email"],
                      prefixIcon: const Icon(Icons.mail),
                      enabled: false,
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    horizontal: 10,
                    vertical: 5,
                    hintText: '+${AppCubit.get(context).userInfo["full_phone"]}',
                    prefixIcon: const Icon(Icons.phone_in_talk),
                    enabled: false,
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
