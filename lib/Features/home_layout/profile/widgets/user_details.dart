import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/widgets/custom_text_field.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 203.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: kFourthColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
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
            CustomTextField(
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
            CustomTextField(
              keyboardType: TextInputType.phone,
              horizontal: 10,
              vertical: 5,
              hintText: "+${AppCubit.get(context).userInfo["full_phone"]}",
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
    );
  }
}
