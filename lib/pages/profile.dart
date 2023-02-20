// ignore_for_file: must_be_immutable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

///
import '../pages/setting.dart';
import '../controllers/navigator_controllers.dart';
import '../controllers/wallet_controller.dart';
import '../controllers/discount_controller.dart';
import '../utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: mainDrawer(0),
        appBar: const UserProfileAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopUserInfo(),
              Stack(children: [
                const PurpleSection(),
                BottomSection(),
              ])
                  .box
                  .size(w, h / 1.6)
                  .margin(const EdgeInsets.only(top: 10))
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}

///Bottom Section Widget Components
class BottomSection extends StatelessWidget {
  BottomSection({
    Key? key,
  }) : super(key: key);

  List<String> performances = [
    "Orders History",
    "Payment methods",
    "Tracking",
    "Statistics",
    "Settings",
    "Log Out"
  ];

  List<String> imagePath = [
    'assets/images/his.png',
    'assets/images/pay.png',
    'assets/images/tr.png',
    'assets/images/stas.png',
    'assets/images/set.png',
    'assets/images/log.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: GridView.builder(
              itemCount: 6,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.99,
              ),
              itemBuilder: (context, index) {
                return FadeInUp(
                    delay: Duration(milliseconds: 600 * index ~/ 1.5),
                    child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          FadeInUp(
                              delay: Duration(milliseconds: 650 * index ~/ 1.5),
                              child: Image.asset(imagePath[index])
                                  .box
                                  .size(100, 100)
                                  .make()),
                          7.heightBox,
                          FadeInUp(
                            delay: Duration(
                              milliseconds: 700 * index ~/ 1.5,
                            ),
                            child: Text(performances[index],
                                style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                        255, 117, 117, 117),
                                    fontSize: 16)),
                          )
                        ])
                        .box
                        .margin(const EdgeInsets.all(15.0))
                        .roundedLg
                        .border(color: unSelectedColor)
                        .make()
                        .onTap(() {
                      index == 4
                          ? Get.to(const SettingPage(),
                              transition: Transition.cupertino)
                          : Container();
                    }));
              }).box.size(w, h / 2.2).white.roundedLg.make()),
    );
  }
}

///Purple Section Widget Components
class PurpleSection extends StatelessWidget {
  const PurpleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Container(
        width: w,
        height: h / 5,
        decoration: const BoxDecoration(
            color: Color(0xff6952ED),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ComponentsOfPurpleSection(
              title: Text(
                Get.find<DiscountController>()
                    .calDiscount(Get.find<WalletController>().totalAmount()),
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Discount",
            ),
            ComponentsOfPurpleSection(
              title: Text(
                "${Get.find<WalletController>().walletFood.length}",
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Total Items",
            ),
            ComponentsOfPurpleSection(
              title: Text(
                "\$${Get.find<WalletController>().totalAmount().toInt()}",
                style: GoogleFonts.oxygen(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Total price",
            ),
          ],
        ),
      ),
    );
  }
}

/// Components of Purple Section Widget Components
class ComponentsOfPurpleSection extends StatelessWidget {
  Text title;
  String subtitle;
  //
  ComponentsOfPurpleSection(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        delay: const Duration(milliseconds: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              delay: const Duration(milliseconds: 450),
              child: title,
            ),
            5.heightBox,
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: subtitle.text.color(unSelectedColor).size(16).make(),
            ),
          ],
        )
            .box
            .size(w / 3.7, h / 7.3)
            .margin(const EdgeInsets.only(bottom: 20))
            .roundedLg
            .color(unSelectedColor.withOpacity(0.5))
            .make());
  }
}

/// Top User Section Info Widget Components
class TopUserInfo extends StatelessWidget {
  const TopUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/profile.png")
              .box
              .color(const Color(0xff6952ED))
              .roundedFull
              .make(),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Irfan Nazir",
                style: GoogleFonts.oxygen(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              Text(
                "Flutter Developer",
                style: GoogleFonts.oxygen(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ).box.size(w, h / 8).make(),
    );
  }
}

/// User profile Section AppBar
class UserProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const UserProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.menu_rounded, color: Colors.black, size: 35),
      actions: [
        const Icon(
          LineIcons.shoppingCart,
          color: Colors.black,
          size: 35,
        ).p2().onTap(() {
          Get.find<NavigatorController>().changeNavBarIndex(1);
        }),
      ],
    );
  }
}
