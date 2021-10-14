import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticket_box/src/common/app_init.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/common/strings.dart';
import 'package:ticket_box/src/pages/home/views/home_page.dart';
import 'package:ticket_box/src/pages/login_gmail/views/login_email_page.dart';
import 'package:ticket_box/src/pages/login_phone/views/login_phone_screen.dart';
import 'package:ticket_box/src/pages/login_phone/views/verify_phone_screen.dart';
import 'package:ticket_box/src/pages/notifications/views/notifications_page.dart';
import 'package:ticket_box/src/pages/profile/views/profile_page.dart';
import 'package:ticket_box/src/pages/profile_detail/views/profile_detail_page.dart';
import 'package:ticket_box/src/pages/update_infomation_signup/views/update_profile_page.dart';
import 'package:ticket_box/src/routes/app_pages.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  AppInit.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // thông tin tham khảo ở đây:
    // https://devera.vn/blog/our-blog-1/post/flutter-va-nhung-cau-hoi-thuong-gap-khi-phong-van-35

    // Cách điều hướng màn hình
    //cách 1: (khuên dùng :V)
    return GetMaterialApp(
      title: Strings.appName,
      builder: BotToastInit(),
      theme: ThemeData(fontFamily: Fonts.montserrat),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );

    // Cách này chuyển trang đơn giản hơn:
    // Get.toNamed(Routes.home);
    // Get.toNamed(Routes.login);
    // Get.toNamed(Routes.profile);

    //cách 2:
    return MaterialApp(
      initialRoute: '/loin',
      routes: <String, WidgetBuilder>{
        '/home': (context) =>HomePage(), // chuyển trang:  Navigator.pushNamed(context, '/home');
        '/login': (context) =>LoginEmailPage(),// Navigator.pushNamed(context, '/login');
        '/loginPhone': (context) =>LoginPhonePage(), // Navigator.pushNamed(context, '/loginPhone');
        '/phoneVerify': (context) =>VerifyPhoneScreen(),
        '/profile': (context) =>ProfilePage(),
        '/profileDetail': (context) =>ProfileDetailPage(),
        '/updateProfile': (context) =>UpdateProfilePage(),
        '/notifications': (context) =>NotificationsPage(),
      },
    );
    // thì chuyển trang sẽ dùng:
    //Navigator.pushNamed(context, '/loginPhone');
  }
}
