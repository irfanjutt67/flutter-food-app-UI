import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';
//
import '../pages/landscape_mode.dart';
import '../controllers/splash_controller.dart';
import '../utils/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      Get.find<SplashController>();
      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: w,
            height: h,
            child: Stack(children: [
              Positioned(
                top: 130,
                left: 90,
                child: FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Text(
                      "Food Delivery",
                      style: GoogleFonts.bebasNeue(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ).box.height(h / 10).make()),
              ),
              Positioned(
                top: 220,
                left: 75,
                child: FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Image.asset('assets/images/5.png')
                        .box
                        .alignCenter
                        .size(w / 1.6, h / 3.3)
                        .make()),
              ),
              Positioned(
                bottom: 70,
                left: 80,
                child: FadeInUp(
                    delay: const Duration(milliseconds: 1300),
                    child: Text(
                      "Wait Moment Beautiful...",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ).box.alignCenter.size(w / 1.6, h / 19).make()),
              ),
              Positioned(
                bottom: 5,
                left: 155,
                child: FadeInUp(
                    delay: const Duration(milliseconds: 1500),
                    child: SpinKitWave(
                      size: 35,
                      itemBuilder: (BuildContext context, int index) {
                        return const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                          ),
                        );
                      },
                    ).box.alignCenter.size(w / 5, h / 15).make()),
              ),
            ]),
          ),
        ),
      );
    } else {
      return const LandScape();
    }
  }
}
