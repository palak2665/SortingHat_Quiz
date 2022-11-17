import 'package:flutter/material.dart';

class AnswerChip extends StatelessWidget {
  const AnswerChip(
      {super.key, this.text, this.colour, this.onselected, this.selected});
  final String? text;
  final Color? colour;
  final ValueChanged<bool>? onselected;
  final bool? selected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        label: SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: Text(text!),
          ),
        ),
        labelStyle: TextStyle(color: colour),
        selected: selected!,
        selectedColor: const Color(0xff7622B6),
        disabledColor: const Color(0xff7622B6),
        backgroundColor: Color(0xff7622B6),
        onSelected: onselected);
  }
}
