import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/util/styles.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/auth_cubit.dart';

class AgreeTerms extends StatelessWidget {
  const AgreeTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsDirectional.only(start: 31.w),
          child: InkWell(
            onTap: () => AuthCubit.get(context).changeAgreeTerms(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: kButtonColor),
                    color: AuthCubit.get(context).agreeTerms == true
                        ? kButtonColor
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done,
                      size: 18.sp,
                      color: AuthCubit.get(context).agreeTerms == true
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  LocaleKeys.agree_to_terms_of_use.tr(),
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
