import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({
    Key? key,
    this.questionText,
  }) : super(key: key);
  final String? questionText;
  @override
  Widget build(BuildContext context) {
    return Text(
      questionText!,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
