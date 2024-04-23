import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/models/quiz_result_model.dart';
import 'package:finance_quiz_app/repository/quiz_repository.dart';
import 'package:finance_quiz_app/router/router.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:finance_quiz_app/widgets/action_button_widget.dart';
import 'package:finance_quiz_app/widgets/app_container.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: quiz.results.isEmpty
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quiz', style: AppTextStyles.h1(AppColors.black)),
                      Column(
                        children: [
                          Image.asset('assets/images/quiz/list-image.jpg'),
                          SizedBox(height: 20),
                          Text('Check how much you know about finance',
                              style: AppTextStyles.text(AppColors.black)),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Quiz', style: AppTextStyles.h1(AppColors.black)),
                  SizedBox(height: 20),
                  ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: quiz.results.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (BuildContext context, int index) {
                        final QuizResultModel _result = quiz.results[index];
                        return AppContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${_result.count}/${quiz.questionCount}',
                                  style: AppTextStyles.h1(AppColors.red)),
                              SizedBox(height: 5),
                              Text(_result.message, style: AppTextStyles.text(AppColors.black)),
                              SizedBox(height: 5),
                              Text('${_result.date.day}/${_result.date.month}/${_result.date.year}', style: AppTextStyles.text(AppColors.black60)),

                            ],
                          ),
                        );
                      }),
                ],
              ),
            ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
        text: 'Start',
        width: MediaQuery.of(context).size.width * 0.9,
        onTap: () {
          context.router.push(QuizGameRoute(quiz: quiz));
        },
      ),
    );
  }
}
