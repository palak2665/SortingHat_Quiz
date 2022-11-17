// To parse this JSON data, do
//
//     final quizData = quizDataFromJson(jsonString);

import 'dart:convert';

QuizData quizDataFromJson(String str) => QuizData.fromJson(json.decode(str));

String quizDataToJson(QuizData data) => json.encode(data.toJson());

class QuizData {
  QuizData({
    this.results,
  });

  List<Result>? results;

  factory QuizData.fromJson(Map<String, dynamic> json) => QuizData(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.question,
    this.answers,
  });

  String? question;
  List<Answer>? answers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.text,
    this.score,
  });

  String? text;
  int? score;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "score": score,
      };
}
