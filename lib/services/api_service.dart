import 'package:flutter/cupertino.dart';

import '../model/question_model.dart';

class Services {
  static Future<QuizData> getQuizData(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/quiz.json');
    final reportData = quizDataFromJson(data);
    return reportData;
  }
}
