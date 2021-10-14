import 'package:get/get.dart';
import 'package:ticket_box/src/models/account.dart';

class SharedStates extends GetxService {
  /// selected bottom bar index
  final bottomBarSelectedIndex = 0.obs;

  /// Save the coupon in use detail
  // void saveCouponInUse(value) => couponInUse.value = value;

  /// Save the coupon detail
  // void saveCoupon(value) => coupon.value = value;

  // User login in app
  Account? account;

// final couponDetail = Coupon().obs;
}
