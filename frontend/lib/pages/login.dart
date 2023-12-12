import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
        child: Stack(
          children: [
            Positioned(
              left: 60,
              top: 750,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 122, vertical: 20),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFA3D3B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 405,
              child: SizedBox(
                width: 313,
                height: 198,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 313,
                        height: 87,
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
                              width: 313,
                              height: 53,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: Color(0xFFFA3D3B)),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: TextField(
                                controller: emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 111,
                      child: SizedBox(
                        width: 313,
                        height: 87,
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
                              width: 313,
                              height: 53,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: Color(0xFFFA3D3B)),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
              left: 95,
              top: 145,
              child: Container(
                width: 219,
                height: 53,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/BrokeFlix.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 87,
              top: 318,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFFFA3D3B),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 55),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
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
      ),
    );
  }
}
