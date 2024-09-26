import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/page_layout.dart';

class OnboardingCard extends StatelessWidget {
  final String imageurl;
  final String title;
  final Widget child;
  final String description;
  final Color color;

  const OnboardingCard({
    super.key,
    required this.imageurl,
    required this.title,
    required this.description,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: color,
          image: const DecorationImage(
            image: AssetImage("assets/810.png"),
            fit: BoxFit.cover,
            opacity: .5,
          ),
        ),
        child: PageLayout(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildLogo(),
              _buildImage(),
              _buildButtonAppbar(),
              _buildTitle(),
              _buildDescription(),
            ],
          ),
        ));
  }

  Positioned _buildButtonAppbar() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(color: color, boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0, -65),
            blurStyle: BlurStyle.normal,
            blurRadius: 20,
            spreadRadius: 40,
          ),
          BoxShadow(
            color: color,
            offset: const Offset(0, -85),
            blurStyle: BlurStyle.normal,
            blurRadius: 35,
            spreadRadius: 50,
          ),
        ]),
        child: child,
      ),
    );
  }

  Positioned _buildDescription() {
    return Positioned(
      bottom: 200,
      right: 0,
      left: 0,
      child: AppText(
        text: description,
        style: AppTextStyle.p,
      ),
    );
  }

  Positioned _buildTitle() {
    return Positioned(
      bottom: 260,
      right: 0,
      left: 0,
      child: AppText(
        text: title,
        style: AppTextStyle.h1_bold,
      ),
    );
  }

  Positioned _buildImage() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 250,
      child: Container(
        width: 459,
        height: 459,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageurl),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Positioned _buildLogo() {
    return Positioned(
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
    );
  }
}
