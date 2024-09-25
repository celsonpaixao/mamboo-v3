import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_card.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/page_layout.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        color: primary500,
        title: "Um lugar para tudo o que você imaginar",
        description:
            "Com o super app Mamboo, você tem os melhores restaurantes, mercados e lojas na palma da sua mão.",
        imageurl: "assets/cheerful-young-man-eating-burger-illustration.png",
        child: Column(
          children: [
            AppButton(
              text: "Seguinte",
              icon: Icons.arrow_forward_sharp,
              type: TypeButton.secondary,
              onPressed: () {
                Modular.to.pushNamed(onboarding2);
              },
            ),
            const AppVerticalSpacing(),
            AppButton(
              text: "Pular",
              type: TypeButton.translucent,
              onPressed: () {
                Modular.to.pushNamed(onboarding5);
              },
            )
          ],
        ),
      ),
    );
  }
}
