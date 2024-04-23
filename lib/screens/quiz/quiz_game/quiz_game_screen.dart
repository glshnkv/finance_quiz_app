import 'package:auto_route/auto_route.dart';
import 'package:finance_quiz_app/models/quiz_model.dart';
import 'package:finance_quiz_app/router/router.dart';
import 'package:finance_quiz_app/theme/colors.dart';
import 'package:finance_quiz_app/theme/textstyles.dart';
import 'package:finance_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizGameScreen extends StatefulWidget {
  final QuizModel quiz;
  const QuizGameScreen({super.key, required this.quiz});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int result = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Continue";
  bool answered = false;


  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,

      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller!,
                    onPageChanged: (page) {
                      if (page == widget.quiz.quiz.length - 1) {
                        setState(() {
                          btnText = "Finish";
                        });
                      }
                      setState(() {
                        answered = false;
                      });
                    },
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.router.pop();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_back_ios_new, color: AppColors.black),
                                      SizedBox(width: 5),
                                      Text(
                                          'Back',
                                          style: AppTextStyles.text(AppColors.black)
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "${index + 1}/${widget.quiz.questionCount}",
                                  textAlign: TextAlign.center,
                                    style: AppTextStyles.text(AppColors.black)
                                ),
                              ],
                            ),
                            Image.asset('assets/images/quiz/game-image.jpg'),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "${widget.quiz.quiz[index].question}",
                                  style: AppTextStyles.h2(AppColors.black)
                              ),
                            ),
                            for (int i = 0;
                            i < widget.quiz.quiz[index].answers!.length;
                            i++)
                              GestureDetector(
                                onTap: !answered
                                    ? () {
                                  if (widget
                                      .quiz.quiz[index].answers!.values
                                      .toList()[i]) {
                                    result++;
                                    print(result);
                                  } else {
                                    print(result);
                                  }
                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                                    : null,
                                child: Row(
                                  children: [
                                    Icon(Icons.radio_button_checked, color: btnPressed
                                        ? widget.quiz.quiz[index].answers!.values
                                        .toList()[i]
                                        ? AppColors.red
                                        : AppColors.black
                                        : AppColors.black,),
                                    SizedBox(width: 5,),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                      child: Text(
                                          widget.quiz.quiz[index].answers!.keys
                                              .toList()[i],
                                          style: AppTextStyles.text(AppColors.black)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ActionButtonWidget(
                              text: btnText,
                              width: 300,
                              onTap: () {
                                if (_controller!.page?.toInt() ==
                                    widget.quiz.quiz.length - 1) {
                                  context.router.push(QuizResultRoute(
                                      result: result,
                                      quiz: widget.quiz,
                                      ));
                                } else {
                                  _controller!.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                  setState(() {
                                    btnPressed = false;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: widget.quiz.quiz.length,
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
