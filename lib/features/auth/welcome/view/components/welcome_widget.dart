import 'package:auth/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
        return SizedBox(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myFont",
                      ),
                    ),
                    const SizedBox(
                      height:20,
                    ),
                    Image.asset("images/assets/images/welcome.png",
                      width: context.width,
                      height:context.height/2,
                    ),

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
                    const SizedBox(
                      height: 20,
                    )
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

            ],
          ),
        );

  }
}
