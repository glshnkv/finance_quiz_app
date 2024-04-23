import 'package:finance_quiz_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.red10,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: child,
    );
  }
}