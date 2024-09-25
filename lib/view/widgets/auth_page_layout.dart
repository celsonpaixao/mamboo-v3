import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;
  const AuthPageLayout({
    super.key,
    required this.child,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary900,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/810.png"),
              fit: BoxFit.cover,
              opacity: .5,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: 1.15,
                child: Image.asset(
                  "assets/woman-with-pink-bag-that-says-afro.png",
                  width: 459,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
               Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration:
                      const BoxDecoration(color: primary900, boxShadow: [
                    BoxShadow(
                      color: primary900,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 90,
                      blurRadius: 80,
                    )
                  ]),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  padding: const EdgeInsets.only(top: 70),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/mamboo_white_upscayl_2x_realesrgan-x4plus.png"),
                            ),
                          ),
                        ),
                        const AppVerticalSpacing(
                          values: 10,
                        ),
                        AppText(
                          text: title,
                          style: AppTextStyle.h1_bold,
                        ),
                        const AppVerticalSpacing(
                          values: 10,
                        ),
                        AppText(
                          text: description,
                          style: AppTextStyle.p,
                        ),
                        child,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 20,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.4), // Cor de fundo com opacidade
                    shape: BoxShape.circle, // Deixa o botão circular
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 16, // Tamanho do ícone,
                    ),
                    padding: EdgeInsets.zero, // Remove o padding extra
                    onPressed: () {
                      Modular.to.pop();
                    },
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
