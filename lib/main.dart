import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maosul2/Features/auth/data/auth_cubit.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import 'package:maosul2/core/util/app_router.dart';
import 'core/bloc_observer.dart';
import 'core/cache/cache_helper.dart';
import 'core/location/location_helper.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocationHelper.determinePosition();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
   Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      saveLocale: true,
      useOnlyLangCode: true,
      startLocale:
          Locale(CacheHelper.getLang() == "" ? "ar" : CacheHelper.getLang()),
      assetLoader: const CodegenLoader(),
      path: 'assets/lang',
      fallbackLocale:
          Locale(CacheHelper.getLang() == "" ? "ar" : CacheHelper.getLang()),
      child: const MaosulApp(),
    ),
  );
}

class MaosulApp extends StatelessWidget {
  const MaosulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(create: (context) => AuthCubit()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: (context, child) => child!,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: AppRouters.routers,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        ),
      ),
    );
  }
}
