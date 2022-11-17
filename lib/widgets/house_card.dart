import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class HouseCard extends StatelessWidget {
  const HouseCard({
    Key? key,
    required this.imagePath,
    required this.colour,
    required this.barrieColor,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String description;
  final Color colour;
  final Color barrieColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.36,
      child: GestureDetector(
        onTap: (() {
          showGeneralDialog(
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return const Text('error');
              },
              barrierDismissible: true,
              barrierColor: barrieColor,
              barrierLabel: '',
              transitionBuilder: (context, anim1, anim2, child) {
                return Transform.rotate(
                  angle: math.radians(anim1.value * 360),
                  child: AlertDialog(
                    shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16.0)),
                    title: Text(title),
                    content: Text(description),
                  ),
                );
              },
              transitionDuration: Duration(milliseconds: 300));
        }),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: colour,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
