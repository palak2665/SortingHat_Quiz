import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/house_card.dart';

class HouseDetails extends StatelessWidget {
  const HouseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Houses',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HouseCard(
                    imagePath: 'assets/images/gryfindor.png',
                    colour: const Color(0xffA80000),
                    barrieColor: const Color(0xffA80000).withOpacity(0.8),
                    title: 'GRYFFINDOR',
                    description:
                        'Gryffindors are associated with daring, bravery, nerve and chivalry. Gryffindors can be cocky and reckless; they are more prone to saying something or getting into a hairy situation before thinking it through than other Hogwarts houses. ',
                  ),
                  HouseCard(
                    imagePath: 'assets/images/slytherin.png',
                    colour: const Color(0xff005E0A),
                    barrieColor: const Color(0xff005E0A).withOpacity(0.8),
                    title: 'SLYTHERIN',
                    description:
                        'Slytherins are associated with cunning, ambition and a tendency to look after their own self instead of others. Some other traits include shrewdness and traditionalism. Slytherins are always striving to be the best, something they have in common with Ravenclaws whether it is in Quidditch or House Points, they will do almost anything to achieve honor and glory.',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HouseCard(
                      imagePath: 'assets/images/ravenclaw.png',
                      colour: const Color(0xff000A61),
                      barrieColor: const Color(0xff000A61).withOpacity(0.8),
                      description:
                          'Ravenclaws possess the traits of cleverness, wisdom, wit, intellectual ability and creativity. According to Slytherin prefect Gemma Farley, Ravenclaws are so competitive when it comes to academic success that they are known to back stab each other, and likely other students, in order to get top marks. Many well-known inventors and innovators have come from Ravenclaw.',
                      title: 'RAVENCLAW',
                    ),
                    HouseCard(
                      imagePath: 'assets/images/hufflepuff.png',
                      colour: const Color(0xffFF6B01),
                      title: 'HUFFLEPUFF',
                      barrieColor: const Color(0xffFF6B01).withOpacity(0.8),
                      description:
                          'Hufflepuffs are associated with trustworthiness, loyalty, and a strong work ethic. Hufflepuff has produced the fewest Dark witches and wizards of any House. It is stated also in the Sorting Hat’s song that they are “unafraid of toil”, implying that Hufflepuffs are also brave.',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            child: Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55,
                    child: CustomBtn(
                      onPress: () {
                        Navigator.pushNamed(context, '/quiz');
                      },
                    ))),
          ),
        ],
      )),
    );
  }
}
