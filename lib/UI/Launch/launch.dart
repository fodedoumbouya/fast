import 'package:fast/UI/Pages/LogIn/login.dart';
import 'package:fast/UI/Pages/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Launch extends StatelessWidget {
  const Launch({Key? key}) : super(key: key);

  Future<void> login() async {
    //Check if the app should go for Login or MainPage
    Get.to(() => const Register());
  }

// We can do alimation here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: TweenAnimationBuilder(
                  tween: ColorTween(
                      begin: Theme.of(context).primaryColor,
                      end: Theme.of(context).backgroundColor),
                  duration: const Duration(seconds: 3),
                  onEnd: () => login(),
                  builder: (_, Color? color, __) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
