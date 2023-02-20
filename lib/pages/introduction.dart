import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

//
import '../navigator.dart';
import 'intro_button.dart';

const blue = Color(0xFF4781ff);

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPage();
}

class _IntroductionPage extends State<IntroductionPage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Slide(
                  hero: Image.asset("assets/images/6.png"),
                  title: "Choose Favorite Food",
                  subtitle:
                      "Find your favorite food that you want to buy easily",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("assets/images/7.png"),
                  title: "Greate Services",
                  subtitle:
                      "Save time and money while enjoying your life to the max!",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("assets/images/8.png"),
                  title: "Food Delivery",
                  subtitle:
                      "Your food is delivered to your home safely and securely",
                  onNext: () {
                    Get.offAll(() => const MainNavigator(),
                        transition: Transition.cupertino);
                  }),
            ]),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            hero.box.size(double.infinity, 300).make(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.bebasNeue(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    10.heightBox,
                    Text(
                      subtitle,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    40.heightBox,
                    ProgressButton(onNext: onNext),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Get.offAll(() => const MainNavigator(),
                      transition: Transition.cupertino);
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
                .box
                .roundedFull
                .alignCenter
                .size(70, 70)
                .color(blue)
                .make()
                .onTap(onNext))
      ]),
    );
  }
}
