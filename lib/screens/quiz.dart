import 'package:flutter/material.dart';
import 'package:hogwaarts_quiz/screens/result_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../model/question_model.dart';
import '../services/api_service.dart';
import '../widgets/answer.dart';
import '../widgets/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int? defaultChoiceIndex;
  int _questionNumber = 1;
  int _score = 0;
  //int? _currentScore;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    defaultChoiceIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.05,
                image: AssetImage('assets/images/hogwarts.png'),
                fit: BoxFit.contain)),
        child: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FutureBuilder<QuizData>(
                future: Services.getQuizData(context),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (snapshot.hasData) {
                    List<Result>? res = data!.results;
                    return Stack(
                      children: [
                        PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _controller,
                            itemCount: res!.length,
                            itemBuilder: (context, index) {
                              List<Answer>? ans = res[index].answers;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Questions(
                                      questionText:
                                          res[index].question.toString(),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                          itemCount: ans!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: AnswerChip(
                                                text:
                                                    ans[index].text.toString(),
                                                colour: Colors.white,
                                                selected:
                                                    defaultChoiceIndex == index,
                                                onselected: (value) {
                                                  setState(() {
                                                    if (_questionNumber <
                                                        res.length) {
                                                      defaultChoiceIndex =
                                                          index;
                                                      // _currentScore =
                                                      //     ans[index].score;
                                                      _questionNumber++;
                                                      _score += ans[index].score
                                                          as int;
                                                      // debugPrint(
                                                      //     _score.toString());
                                                      _controller.nextPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      250),
                                                          curve: Curves
                                                              .easeInCirc);
                                                    } else {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    ResultPage(
                                                              resultScore:
                                                                  _score,
                                                              resetHandlar: () {
                                                                Navigator.pushNamedAndRemoveUntil(
                                                                    context,
                                                                    '/home',
                                                                    ((route) =>
                                                                        false));
                                                              },
                                                            ),
                                                          ));
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              );
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    child: CustomProgressBar(
                                      value: _questionNumber,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(
//       vertical: 10.0, horizontal: 0),
//   child: GestureDetector(
//     onTap: () {
//       setState(() {
//         _questionNumber--;
//         _currentScore = 0;
//       });

//       _controller.previousPage(
//           duration:
//               const Duration(milliseconds: 200),
//           curve: Curves.easeInCirc);
//     },
//     child: const CircleAvatar(
//       radius: 25,
//       backgroundColor: Color(0xff7622B6),
//       child: Center(
//           child: Icon(
//         Icons.arrow_back_ios_new_rounded,
//         color: Colors.white,
//       )),
//     ),
//   ),
// ),

// Padding(
//   padding: const EdgeInsets.symmetric(
//       vertical: 10.0, horizontal: 0),
//   child: GestureDetector(
//     onTap: () {
//       if (_questionNumber < res.length) {
//         setState(() {
//           if (_currentScore == 0) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(const SnackBar(
//               content: Text(
//                   "Please select an answer."),
//               duration:
//                   Duration(milliseconds: 300),
//             ));
//           } else {
//             _questionNumber++;
//             _score += _currentScore as int;
//             debugPrint(_score.toString());
//             _controller.nextPage(
//                 duration: const Duration(
//                     milliseconds: 250),
//                 curve: Curves.easeInCirc);
//             defaultChoiceIndex =
//                 defaultChoiceIndex;
//           }
//           defaultChoiceIndex = null;
//           _currentScore = 0;
//         });
//       } else {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ResultPage(
//                 resultScore: _score,
//                 resetHandlar: () {
//                   Navigator
//                       .pushNamedAndRemoveUntil(
//                           context,
//                           '/home',
//                           ((route) => false));
//                 },
//               ),
//             ));
//       }
//     },
//     child: const CircleAvatar(
//       radius: 25,
//       backgroundColor: Color(0xff7622B6),
//       child: Icon(
//         Icons.arrow_forward_ios_rounded,
//         color: Colors.white,
//       ),
//     ),
//   ),
// )

class CustomProgressBar extends StatelessWidget {
  final int value;

  const CustomProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              StepProgressIndicator(
                totalSteps: 10,
                currentStep: value,
                size: 10,
                padding: 0,
                selectedColor: const Color(0xff7622B6),
                unselectedColor: Colors.grey,
                roundedEdges: const Radius.circular(10),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: value * value * 2.5, bottom: 15),
                    child: const Image(
                      image: AssetImage('assets/images/engine.png'),
                      width: 70.0,
                      height: 70.0,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
