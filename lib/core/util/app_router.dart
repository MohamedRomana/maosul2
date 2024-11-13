import 'package:go_router/go_router.dart';
import 'package:maosul2/Features/provider_screens/provider_orders/orders_details/provider_orders_details.dart';
import 'package:maosul2/Features/provider_screens/provider_profile/provider_profile.dart';
import 'package:maosul2/core/cubit/app_cubit.dart';
import '../../Features/Search/search_view.dart';
import '../../Features/auth/views/provider_register/provider_register_view.dart';
import '../../Features/drawer/about_app/about_app_view.dart';
import '../../Features/drawer/call_us/call_us_view.dart';
import '../../Features/drawer/privacy_policy/privacy_policy_view.dart';
import '../../Features/drawer/technical_support/technical_support_view.dart';
import '../../Features/categories/categories_view.dart';
import '../../Features/categories/widgets/categories_gride_view.dart';
import '../../Features/home_layout/Home/home_view.dart';
import '../../Features/auth/views/client_register/client_register.dart';
import '../../Features/auth/views/forget_pass/activation_code_view.dart';
import '../../Features/auth/views/active_code/activation_pin_code_view.dart';
import '../../Features/auth/views/change_pass/change_password_view.dart';
import '../../Features/auth/views/login/login_view.dart';
import '../../Features/home_layout/home_layout.dart';
import '../../Features/favourites/favourites_view.dart';
import '../../Features/profile_edit/profile_edit_view.dart';
import '../../Features/home_layout/stores/strores_view.dart';
import '../../Features/notifications/notification_view.dart';
import '../../Features/home_layout/profile/profile_view.dart';
import '../../Features/home_layout/orders/orders_view.dart';
import '../../Features/home_layout/cart/cart_view.dart';
import '../../Features/order_details/order_details_view.dart';
import '../../Features/provider_screens/provider_orders/provider_orders_view.dart';
import '../../Features/provider_screens/provider_profile/provider_profile_edit/provider_profile_edit.dart';
import '../../Features/start/languages/views/languages_view.dart';
import '../../Features/start/on_boarding/views/on_boarding_view.dart';
import '../../Features/start/splash/splash_view.dart';
import '../../Features/start/types/types_view.dart';
import '../../Features/stores_name/stores_name_view.dart';
import '../location/location.dart';

abstract class AppRouters {
  static const kOnBoardingView = '/onboardingView';
  static const kLanguagesView = '/languagesView';
  static const kTypesView = '/typesView';
  static const kLoginView = '/clientLoginView';
  static const kClientRegister = '/clientRegister';
  static const kProviderRegisterView = '/providerRegisterView';
  static const kActivationcode = '/activationcode';
  static const kActivationPincode = '/activationPincode';
  static const kChangePasswordView = '/changePasswordView';
  static const kHomeView = '/homeView';
  static const kCartView = '/cartview';
  static const kProfileView = '/profileView';
  static const kOrdersView = '/ordersView';
  static const kStroresView = '/storesView';
  static const kHomeLayout = '/homeLayout';
  static const kCategoriesView = '/categoriesView';
  static const kCategoriesGrideView = '/categoriesGrideView';
  static const kStoresNameView = '/storesNameView';
  static const kProfileEditView = '/profileEditView';
  static const kFavouritesView = '/favouritesView';
  static const kNotificationView = '/notificationView';
  static const kOrderDetailsView = '/orderDetailsView';
  static const kCallUsView = '/callUsView';
  static const kAboutAppView = '/aboutAppView';
  static const kTechnicalSupportView = '/technicalSupportView';
  static const kPrivacyPolicyView = '/privacyPolicyView';
  static const kLocationView = '/locationView';
  static const kSearchView = '/searchView';
  static const kprovidreOrderView = '/providerView';
  static const kProviderOrdersDetails = '/providerOrdersDetails';
  static const kProviderProfileView = '/providerProfileView';
  static const kProviderProfileEdit = '/providerProfileEdit';

  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLanguagesView,
        builder: (context, state) => const LanguagesView(),
      ),
      GoRoute(
        path: kTypesView,
        builder: (context, state) => const TypesView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(
          type: AppCubit.get(context).typeIndex == 0 ? "client" : "provider",
        ),
      ),
      GoRoute(
        path: kClientRegister,
        builder: (context, state) => const ClientRegister(),
      ),
      GoRoute(
        path: kProviderRegisterView,
        builder: (context, state) => const ProviderRegisterView(),
      ),
      GoRoute(
        path: kActivationcode,
        builder: (context, state) => const ActivationCodeView(),
      ),
      GoRoute(
        path: kActivationPincode,
        builder: (context, state) => const ActivationPinCodeView(),
      ),
      GoRoute(
        path: kChangePasswordView,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kOrdersView,
        builder: (context, state) => const OrdersView(),
      ),
      GoRoute(
        path: kStroresView,
        builder: (context, state) => const StoresView(),
      ),
      GoRoute(
        path: kHomeLayout,
        builder: (context, state) => const HomeLayout(),
      ),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: kCategoriesGrideView,
        builder: (context, state) => const CategoriesGrideView(),
      ),
      GoRoute(
        path: kStoresNameView,
        builder: (context, state) => const StoresNameView(),
      ),
      GoRoute(
        path: kProfileEditView,
        builder: (context, state) => const ProfileEditView(),
      ),
      GoRoute(
        path: kFavouritesView,
        builder: (context, state) => const FavouritesView(),
      ),
      GoRoute(
        path: kNotificationView,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) => const OrderDetailsView(),
      ),
      GoRoute(
        path: kCallUsView,
        builder: (context, state) => const CallUsView(),
      ),
      GoRoute(
        path: kAboutAppView,
        builder: (context, state) => const AboutAppView(),
      ),
      GoRoute(
        path: kTechnicalSupportView,
        builder: (context, state) => const TechnicalSupportView(),
      ),
      GoRoute(
        path: kPrivacyPolicyView,
        builder: (context, state) => const PrivacyPolicyView(),
      ),
      GoRoute(
        path: kLocationView,
        builder: (context, state) => const Location(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kprovidreOrderView,
        builder: (context, state) => const ProviderOrderView(),
      ),
      GoRoute(
        path: kProviderOrdersDetails,
        builder: (context, state) => const ProviderOrdersDetails(),
      ),
      GoRoute(
        path: kProviderProfileView,
        builder: (context, state) => const ProviderProfile(),
      ),
      GoRoute(
        path: kProviderProfileEdit,
        builder: (context, state) => const ProviderProfileEdit(),
      ),
    ],
  );
}
