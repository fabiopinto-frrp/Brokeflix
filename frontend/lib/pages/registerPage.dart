import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'homePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

  final String loginUrl = 'https://brokeflix-api.tech/auth/login';
  final String registerUrl = 'https://brokeflix-api.tech/auth/register';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
          child: Stack(
            children: [
              Positioned(
                left: ScreenUtil().setWidth(45),
                top: ScreenUtil().setHeight(560),
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFA3D3B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      Map<String, String> registerData = {
                        'fullname': nameController.text,
                        'username': usernameController.text,
                        'password': passwordController.text,
                      };

                      await postRequest(registerUrl, registerData);

                      await loginAuto(
                          usernameController.text, passwordController.text);
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
                      'Register',
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
                  height: ScreenUtil().setHeight(220),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: ScreenUtil().setWidth(313),
                          height: ScreenUtil().setHeight(66), // Adjusted height
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
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
                                        width: 1, color: Color(0xFFFA3D3B)),
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                ),
                                child: TextField(
                                  controller: nameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top:
                            ScreenUtil().setHeight(74), // Adjusted top position
                        child: SizedBox(
                          width: ScreenUtil().setWidth(313),
                          height: ScreenUtil().setHeight(66), // Adjusted height
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Username',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                                        width: 1, color: Color(0xFFFA3D3B)),
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                ),
                                child: TextField(
                                  controller: usernameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: ScreenUtil()
                            .setHeight(148), // Adjusted top position
                        child: SizedBox(
                          width: ScreenUtil().setWidth(313),
                          height: ScreenUtil().setHeight(66), // Adjusted height
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                                        width: 1, color: Color(0xFFFA3D3B)),
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(16),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 55),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(20),
                            vertical: ScreenUtil().setHeight(10)),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFFA3D3B),
                            fontSize: ScreenUtil().setSp(16),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
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

      print(url);
      print(res);
      print(data);
      print(response.request?.url);
      print(response.body);

      if (response.statusCode == 201) {
        print('Post request: $url was successful!');
        print('Server response: ${response.body}');
      } else if (response.statusCode == 200) {
        await storage.write(key: 'token', value: response.body);
        await storage.write(key: 'username', value: usernameController.text);
        DateTime expireDate = DateTime.now().add(const Duration(days: 31));
        await storage.write(
            key: "expireDate", value: expireDate.toIso8601String());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        print('Server returned an error:');
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Registration failed'),
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

  Future<void> loginAuto(String username, String password) async {
    Map<String, String> loginData = {
      'username': username,
      'password': password,
    };

    await postRequest(loginUrl, loginData);
  }
}
