import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'registerPage.dart';
import 'homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final storage = FlutterSecureStorage();

  final String loginUrl = 'https://brokeflix-api.tech/auth/login';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: (context, child) => Scaffold(
        body: Form(
          key: formKey,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
                child: Stack(
                  children: [
                    Positioned(
                      left: ScreenUtil().setWidth(45),
                      top: ScreenUtil().setHeight(550),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFA3D3B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            Map<String, String> loginData = {
                              'username': usernameController.text,
                              'password': passwordController.text,
                            };

                            await postRequest(loginUrl, loginData);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(120),
                                vertical: ScreenUtil().setHeight(15)),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(16),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(40),
                      top: ScreenUtil().setHeight(300),
                      child: SizedBox(
                        width: ScreenUtil().setWidth(313),
                        height: ScreenUtil().setHeight(198),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: ScreenUtil().setWidth(300),
                                height: ScreenUtil().setHeight(85),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(16),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(313),
                                      height: ScreenUtil().setHeight(40),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFFA3D3B)),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: usernameController,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: ScreenUtil().setHeight(111),
                              child: SizedBox(
                                width: ScreenUtil().setWidth(300),
                                height: ScreenUtil().setHeight(87),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(16),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(313),
                                      height: ScreenUtil().setHeight(40),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFFA3D3B)),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(90),
                      top: ScreenUtil().setHeight(100),
                      child: Container(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setHeight(40),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/BrokeFlix.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(75),
                      top: ScreenUtil().setHeight(200),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(20),
                                  vertical: ScreenUtil().setHeight(5)),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFFFA3D3B),
                                  fontSize: ScreenUtil().setSp(16),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(55),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(20),
                                    vertical: ScreenUtil().setHeight(10)),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(16),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> postRequest(String url, Map<String, String> data) async {
    try {
      var res = json.encode(data);
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: res,
      );

      print('Request URL: $url');
      print('Request Body: $res');
      print('Response URL: ${response.request?.url}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        await storage.write(key: 'token', value: response.body);
        await storage.write(key: 'username', value: usernameController.text);
        DateTime expireDate = DateTime.now().add(const Duration(days: 31));
        await storage.write(
            key: "expireDate", value: expireDate.toIso8601String());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Your username or password is wrong'),
            action: SnackBarAction(
              label: 'Undo',
              textColor: const Color(0xFFFA3D3B),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      } else {
        print('Unexpected response: ${response.statusCode}');
        print('Response Body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected response: ${response.statusCode}'),
            action: SnackBarAction(
              label: 'Undo',
              textColor: const Color(0xFFFA3D3B),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } catch (error, stackTrace) {
      print('Error sending POST $url: $error');
      print('Caught error: $error');
      print('Stack trace: $stackTrace');
    }
  }
}
