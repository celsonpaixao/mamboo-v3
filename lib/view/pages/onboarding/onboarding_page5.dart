import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_card.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/page_layout.dart';

class OnboardingPage5 extends StatelessWidget {
  const OnboardingPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: primary500,
        child: PageLayout(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/810.png"),
                    fit: BoxFit.cover,
                    opacity: .5,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Transform.scale(
                    scale: 1.15,
                    child: Image.asset(
                      "assets/woman-with-pink-bag-that-says-afro.png",
                      width: 459,
                      height: 500,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // Título
                  const Positioned(
                    bottom: 115,
                    right: 0,
                    left: 0,
                    child: AppText(
                      text: "Mamboo",
                      style: AppTextStyle.h1_bold,
                    ),
                  ),
                  // Descrição
                  const Positioned(
                    bottom: 70,
                    right: 0,
                    left: 0,
                    child: AppText(
                      text:
                          "Agradecemos por baixar nossa App. Crie sua conta ou faça login.",
                      style: AppTextStyle.p,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 600,
                top: 0,
                left: 0,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/mamboo_white_upscayl_2x_realesrgan-x4plus.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration:
                      const BoxDecoration(color: primary500, boxShadow: [
                    BoxShadow(
                      color: primary500,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 50,
                      blurRadius: 30,
                    )
                  ]),
                  child: Column(
                    children: [
                      AppButton(
                        text: "Crie sua conta",
                        icon: Icons.arrow_forward_sharp,
                        type: TypeButton.secondary,
                        onPressed: () {
                          Modular.to.pushNamed(onboarding1);
                        },
                      ),
                      const AppVerticalSpacing(),
                      AppButton(
                        text: "Faça login",
                        type: TypeButton.translucent,
                        isborder: true,
                        onPressed: () {
                          Modular.to.pushNamed(loginPage);
                        },
                      ),
                      const AppVerticalSpacing(),
                      AppButton(
                        text: "Entre sem login",
                        type: TypeButton.translucent,
                        onPressed: () {
                          Modular.to.pushNamed(onboarding1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
