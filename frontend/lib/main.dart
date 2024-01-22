import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/pages/splashScreen.dart';
import 'package:frontend/pages/loginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          // Initialize ScreenUtil
          ScreenUtil.init(
            context,
            designSize: const Size(375, 667),
          );

          return const SplashScreen();
        },
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
