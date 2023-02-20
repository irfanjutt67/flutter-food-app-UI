import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';
//
import '../controllers/navigator_controllers.dart';
import '../controllers/food_controller.dart';
import '../controllers/wallet_controller.dart';
import '../controllers/switch_controller.dart';
import '../pages/details.dart';
import '../controllers/tabBar_controller.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: mainDrawer(3),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              const TopTextWidget(),
              TabBar(),
              const MiddleSaladsPageView(),
              const BottomSaladGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bottom Salad GridView Widget Components
class BottomSaladGridView extends StatelessWidget {
  const BottomSaladGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<FoodController>();
    return SizedBox(
      width: w,
      height: h / 2.598,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _foodController.salads.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.currentSaladIndex = index;
                Get.to(() => const DetailsPage());
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 10,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 700),
                        child: Container(
                          width: w / 2.4,
                          height: h / 4,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        child: Spin(
                          delay: const Duration(milliseconds: 800),
                          child: Image.asset(
                            _foodController.salads[index].img,
                            fit: BoxFit.cover,
                          ).box.size(w / 3, h / 7).makeCentered(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 900),
                        child: Text(
                          _foodController.salads[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ).text.makeCentered().box.size(w / 2.7, h / 30).make(),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1000),
                        child: Text(
                          _foodController.salads[index].subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oxygen(
                              color: const Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 55,
                      top: 175,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1100),
                        child: Text(
                          "\$${_foodController.salads[index].price.toStringAsFixed(2)}",
                          style: GoogleFonts.oxygen(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 7,
                      child: FadeInUp(
                          delay: const Duration(milliseconds: 1150),
                          child: const Icon(
                            Icons.add,
                            color: unSelectedColor,
                          ).box.black.p3.roundedFull.makeCentered().onTap(() {
                            Get.find<WalletController>().add(
                              id: _foodController.salads[index].id,
                              img: _foodController.salads[index].img,
                              title: _foodController.salads[index].title,
                              subtitle: _foodController.salads[index].subtitle,
                              price: _foodController.salads[index].price,
                            );
                          })),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/// Middle Salads PageView Widget Components
class MiddleSaladsPageView extends StatelessWidget {
  const MiddleSaladsPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<FoodController>();
    return PageView.builder(
        itemCount: _foodController.salads.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _controller.currentSaladIndex = index;
              Get.to(() => const DetailsPage());
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              width: w / 1.1,
              child: Stack(children: [
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: FadeInLeft(
                    delay: const Duration(milliseconds: 350),
                    child: Container(
                      width: w / 1.3,
                      height: h / 5.5,
                      decoration: BoxDecoration(
                          color: unSelectedColor,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  left: 5,
                  child: FadeInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: Spin(
                      delay: const Duration(milliseconds: 400),
                      child: Hero(
                        tag: _foodController.salads[index].id,
                        child: Image.asset(
                          _foodController.salads[index].img,
                          fit: BoxFit.cover,
                        ),
                      ).box.size(w / 2.5, h / 5).make(),
                    ),
                  ),
                ),
                Positioned(
                  left: 175,
                  top: 40,
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 450),
                    child: Text(
                      _foodController.salads[index].title,
                      style: GoogleFonts.oxygen(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    _foodController.salads[index].subtitle,
                    style: GoogleFonts.oxygen(
                        color: const Color.fromARGB(255, 135, 134, 134),
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
                )
                    .box
                    .margin(const EdgeInsets.only(
                      left: 175,
                      top: 68,
                    ))
                    .make(),
                Positioned(
                  left: 175,
                  top: 95,
                  child: FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Text(
                      "\$${_foodController.salads[index].price.toStringAsFixed(2)}",
                      style: GoogleFonts.oxygen(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 10,
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 650),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {
                            Get.find<WalletController>().add(
                              id: _foodController.salads[index].id,
                              img: _foodController.salads[index].img,
                              title: _foodController.salads[index].title,
                              subtitle: _foodController.salads[index].subtitle,
                              price: _foodController.salads[index].price,
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: unSelectedColor,
                          )),
                    ),
                  ),
                )
              ]),
            ),
          );
        }).box.size(w, h / 4.5).make();
  }
}

/// TabBar Widget Components
class TabBar extends StatelessWidget {
  TabBar({
    Key? key,
  }) : super(key: key);

  final List<String> tabNames = [
    "Salads",
    "Soups",
    "Grilled",
    "Fish",
  ];

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<TabBarController>();
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 5),
        width: w,
        height: h / 15,
        child: Row(
          children: [
            ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Obx(() {
                    return Text(
                      tabNames[index],
                      style: GoogleFonts.oxygen(
                          color: _controller.currentIndex.value == index
                              ? const Color.fromARGB(255, 234, 234, 234)
                              : Colors.black,
                          fontSize: 16),
                    )
                        .animatedBox
                        .milliSeconds(milliSec: 300)
                        .size(w / 4, double.infinity)
                        .roundedLg
                        .margin(Vx.m4)
                        .alignCenter
                        .color(
                          _controller.currentIndex.value == index
                              ? Colors.black
                              : unSelectedColor,
                        )
                        .make()
                        .onTap(() {
                      _controller.currentIndex.value = index;
                    });
                  });
                }).box.size(w / 1.25, double.infinity).make(),
            Expanded(
              child: RotatedBox(
                  quarterTurns: -15,
                  child: const Icon(LineIcons.horizontalSliders, size: 40)
                      .onTap(() {
                    Get.changeThemeMode(ThemeMode.dark);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

/// Top Text Widget Components
class TopTextWidget extends StatelessWidget {
  const TopTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Text(
                  "Delicious",
                  style: GoogleFonts.oxygen(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AnimatedTextKit(repeatForever: true, animatedTexts: [
                  RotateAnimatedText(' Food',
                      textStyle: GoogleFonts.oxygen(
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                      )),
                  RotateAnimatedText(
                    ' Salad',
                    textStyle: GoogleFonts.oxygen(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ])
              ],
            ),
          ),
          AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText(
              speed: const Duration(milliseconds: 100),
              'We made fresh and Healthy food',
              textStyle: GoogleFonts.oxygen(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            )
          ])
        ],
      ).box.size(w, h / 10).make(),
    );
  }
}

/// MyAppBar Widget Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu_rounded, color: Colors.black, size: 35)
            .onTap(() {
          Scaffold.of(context).openDrawer();
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 10, 2),
            child: Image.asset("assets/images/profile.png")
                .box
                .roundedFull
                .blue500
                .make()
                .onTap(() {
              Get.find<NavigatorController>().changeNavBarIndex(2);
            }),
          )
        ],
      ),
    );
  }
}
