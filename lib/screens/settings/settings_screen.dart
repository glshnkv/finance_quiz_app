import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:finance_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.red10,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/settings/image.jpg',
                          width: 260),
                      SizedBox(height: 10),
                      Text(
                        'Your opinion is important!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2(AppColors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'We need your feedback to get better',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text(AppColors.black60),
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(text: 'Rate app', width: 300, onTap: () {})
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  tileColor: AppColors.red10,
                  leading: SvgPicture.asset('assets/images/settings/terms.svg'),
                  title: Text(
                    'Terms of use',
                    style: AppTextStyles.text(AppColors.black),

                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.red),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  tileColor: AppColors.red10,
                  leading: SvgPicture.asset('assets/images/settings/privacy.svg'),
                  title: Text(
                    'Privacy Policy',
                    style: AppTextStyles.text(AppColors.black),

                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.red),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  tileColor: AppColors.red10,
                  leading: SvgPicture.asset('assets/images/settings/support.svg'),
                  title: Text(
                    'Support page',
                    style: AppTextStyles.text(AppColors.black),

                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.red),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
