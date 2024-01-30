import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3),);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child:
              Image.asset("assets/images/homepage.jpg",fit: BoxFit.cover,),
            ),
            Center(
              child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    return Transform.rotate(angle: animationController!.value);
                  },
                    child :Image.asset(
                      "assets/images/splash.png",
                      fit: BoxFit.cover,
                    ),
                ),
              // child: Image.asset(
              //   "assets/images/splash.png",
              //   height: 100,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}