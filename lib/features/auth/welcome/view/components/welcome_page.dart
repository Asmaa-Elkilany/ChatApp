import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SvgPicture.asset("images/assets/icons/chat.svg"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff6F35A5),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "myFont",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xffE2D3F5),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "myFont",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "images/assets/images/main_top.png",
                  height: 150,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset("images/assets/images/main_bottom.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
