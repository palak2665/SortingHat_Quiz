import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, this.resultScore, this.resetHandlar});
  final int? resultScore;
  final VoidCallback? resetHandlar;
  List get resultPhrase {
    String resultText;
    String imagepath;
    int color;
    if (resultScore! <= 17 && resultScore! >= 9) {
      resultText =
          'You are bold, passionate, and brave. You have a highly-defined sense of right and wrong, and you are not afraid to speak your mind or fight for what you want. Some of the wizarding world'
          's best-known members of house Gryffindor are: Minerva McGonagall, Remus Lupin, Hermione Granger, Order of the Phoenix founder Albus Dumbledore, and of course, Harry Potter!';
      imagepath = 'assets/images/gryfindor.png';
      color = 0xffA80000;
    } else if (resultScore! <= 25 && resultScore! >= 18) {
      resultText =
          'You are wise, perceptive, and quietly brilliant. You may not always be noticed right away, but you are widely respected for your humor and brains. Notable students who the sorting hat has placed in house Ravenclaw include: Luna Lovegood, wand shop founder Garrick Ollivander, and the inventor of Floo powder, Ignatia Wildsmith.';
      imagepath = 'assets/images/ravenclaw.png';
      color = 0xff000A61;
    } else if (resultScore! <= 33 && resultScore! >= 26) {
      resultText =
          'You are reserved, rational, and down-to-earth. You work well with others, are a great team player, and you always take a stand against injustice. Honorable Hufflepuffs throughout history have included: Cedric Diggory, Professor Pomona Sprout, and many years ago - Newton "Newt" Scamander, the well-known author of Fantastic Beasts and Where to Find Them.';
      imagepath = 'assets/images/hufflepuff.png';
      color = 0xffFF6B01;
    } else if (resultScore! <= 40 && resultScore! >= 34) {
      resultText =
          'You are sneaky, resourceful, and not afraid to bend the rules to your advantage. You consistently strive to get ahead, and will do everything you can to be in a position of power. Famous witches and wizards of house Slytherin have included: Professor Severus Snape, Professor Horace Slughorn, Bellatrix Lestrange, Draco Malfoy, and even he-who-must-not-be-named, Tom Riddle, aka Lord Voldemort himself!';
      imagepath = 'assets/images/slytherin.png';
      color = 0xff005E0A;
    } else {
      return [resultText = "Invalid Score", color = 0xff7622B6];
    }
    return [resultText, imagepath, color];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                  decoration: BoxDecoration(
                    color: Color(resultPhrase[2]),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  height: 400,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                      image: AssetImage(resultPhrase[1]),
                    ),
                  )),
              back: Container(
                decoration: BoxDecoration(
                  color: Color(resultPhrase[2]),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                height: 400,
                width: 300,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      resultPhrase[0],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff7622B6)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15))),
              onPressed: resetHandlar,
              child: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
