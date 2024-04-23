import 'package:finance_quiz_app/theme/colors.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  const GradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.yellow,
              AppColors.pink,
              AppColors.red
            ],
            begin: const FractionalOffset(-0.3, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            tileMode: TileMode.clamp),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: child,
    );
  }
}