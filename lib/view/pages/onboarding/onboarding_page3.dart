import 'package:flutter/material.dart';
import 'package:mamaboo_v3/app/app_module.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_card.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: secondary400,
        child: OnboardingCard(
          color: secondary400,
          title: "Entrega de pacotes rápida e confiável",
          description:
              "Simplifique seu dia a dia com nosso serviço de entregas MambooPack.",
          imageurl: "assets/man-wearing-blue-shirt-with-word-d-it.png",
          child: Column(
            children: [
              AppButton(
                text: "Seguinte",
                icon: Icons.arrow_forward_sharp,
                type: TypeButton.secondary,
                onPressed: () => modularSimpleNavigation(router: onboarding4),
              ),
              const AppVerticalSpacing(),
              AppButton(
                text: "Pular",
                type: TypeButton.translucent,
                onPressed: () => modularSimpleNavigation(router: onboarding5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
