import 'package:flutter/material.dart';
import 'package:mamaboo_v3/app/app_module.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_card.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';


class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        color: primary500,
        title: "Uma carteira digital para chamar de sua.",
        description:
            "Conte com o MambooPay para pagar suas compras, fazer transferências e ganhar cashback.",
        imageurl:
            "assets/young-woman-is-holding-mobile-phone-showing-blank-white-screen.png",
        child: Column(
          children: [
            AppButton(
              text: "Seguinte",
              icon: Icons.arrow_forward_sharp,
              type: TypeButton.secondary,
              onPressed:() => modularSimpleNavigation(router: onboarding5),
            ),
          ],
        ),
      ),
    );
  }
}
