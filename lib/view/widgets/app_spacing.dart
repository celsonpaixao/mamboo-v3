import 'package:flutter/material.dart';

class AppVerticalSpacing extends StatelessWidget {
  final double? values;
  const AppVerticalSpacing({super.key, this.values});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: values != null ? values : 16,
    );
  }
}

class AppHorizontalSpacing extends StatelessWidget {
  final double? values;
  const AppHorizontalSpacing({super.key, this.values});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: values != null ? values : 16,
    );
  }
}
