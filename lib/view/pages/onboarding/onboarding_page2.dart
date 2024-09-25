import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/pages/onboarding/onboarding_card.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/page_layout.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingCard(
        color: secondary400,
        title: "Liberdade e praticidade",
        description:
            "Múltiplos meios de pagamento para você pagar da forma que quiser.",
        imageurl: "assets/woman-holding-card-that-says-smart-phone.png",
        child: Column(
          children: [
            AppButton(
              text: "Seguinte",
              icon: Icons.arrow_forward_sharp,
              type: TypeButton.secondary,
              onPressed: () {
                Modular.to.pushNamed(onboarding3);
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