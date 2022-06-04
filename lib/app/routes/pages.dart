import 'package:app_hortifruti_pratico/app/modules/cart/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/cart/page.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/page.dart';
import 'package:app_hortifruti_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/dashboard/page.dart';
import 'package:app_hortifruti_pratico/app/modules/home/page.dart';
import 'package:app_hortifruti_pratico/app/modules/login/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/login/page.dart';
import 'package:app_hortifruti_pratico/app/modules/product/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/product/page.dart';
import 'package:app_hortifruti_pratico/app/modules/store/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/store/page.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/page.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => CheckoutPage(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.userAddress,
      page: () => UserAddressPage(),
      binding: UserAddressBinding(),
    ),
  ];
}