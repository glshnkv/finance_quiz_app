import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/models/news_model.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;
  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.black60),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: AppTextStyles.text(AppColors.black60)
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    widget.news.image,
                    fit: BoxFit.cover,
                    height: 155,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                    widget.news.title,
                    style: AppTextStyles.h2(AppColors.black)
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/news/timer.svg', color: AppColors.black60,),
                    SizedBox(width: 4),
                    Text(widget.news.spendTime,
                        style: AppTextStyles.text(
                            AppColors.black60)),
                  ],),
                SizedBox(height: 10),
                Text(
                  widget.news.article,
                    style: AppTextStyles.text(
                        AppColors.black60)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
