import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff7622B6),
          onPressed: onPress,
          child: const Center(
              child: Image(
                  width: 40,
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/hat.png'))),
        ));
  }
}
