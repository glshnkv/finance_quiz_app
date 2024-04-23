import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/models/news_model.dart';
import 'package:finance_quiz_app/repository/news_repository.dart';
import 'package:finance_quiz_app/router/router.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:finance_quiz_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'News',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final NewsModel _news = newsRepository[index];
                      return AppContainer(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                _news.image,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 230,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    _news.title,
                                    style: AppTextStyles.h2(AppColors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.router.push(NewsInfoRoute(news: _news));
                                        },
                                        child: Text('Read news',
                                            style: AppTextStyles.text(
                                                AppColors.red)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                        SvgPicture.asset('assets/images/news/timer.svg', color: AppColors.black60,),
                                        SizedBox(width: 4),
                                        Text(_news.spendTime,
                                            style: AppTextStyles.text(
                                                AppColors.black60)),
                                      ],),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
