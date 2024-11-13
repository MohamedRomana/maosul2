import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maosul2/core/constants.dart';
import 'package:maosul2/core/widgets/custom_app_bar.dart';
import 'package:maosul2/core/widgets/custom_elevated_button.dart';
import '../../../../core/util/app_router.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../order_details/widgets/order_note_container.dart';
import 'widgets/client_data_container.dart';
import 'widgets/provider_stores_details_container.dart';

class ProviderOrdersDetails extends StatelessWidget {
  const ProviderOrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
              GoRouter.of(context).push(AppRouters.kLocationView);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(Icons.location_on, color: kButtonColor, size: 27.sp),
          ),
          widget2: Container(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ProviderStoresDetailsContainer(),
            SizedBox(height: 20.h),
            const ClientDataContainer(),
            const OrderNoteContainer(),
            Padding(
              padding: EdgeInsets.only(top: 25.h, bottom: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton(
                    onPressed: () {},
                    text: LocaleKeys.accept.tr(),
                    minimumSize: Size(160.w, 48.h),
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: LocaleKeys.reject.tr(),
                    minimumSize: Size(160.w, 48.h),
                    backgroundColor: const Color(0xffB5C4B5),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
