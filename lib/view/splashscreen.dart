import 'package:flutter/material.dart';
import 'package:intravel/theme/app_colors.dart';
import 'package:intravel/view/login.dart';
import '../constants/file_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    setState(() {
      animate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.7,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.softLight),
                  image: AssetImage(
                    FileConstants.splash,
                  ),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                bottom: animate ? 50 : 10,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Let's explore",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300),
                                ),
                                const Text(
                                  'India',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 55,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'We are happy to share with you the best tips about places where you can relax.  But you also find the most enjoyable trips!',
                                  style: TextStyle(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.7),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: animate,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[800],
                                foregroundColor: Colors.white),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(letterSpacing: 1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
