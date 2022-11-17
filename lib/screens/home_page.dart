import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: SizedBox(
                width: 200,
                height: 200,
                child: Image(image: AssetImage('assets/images/icon.png'))),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Text(
                    'Which House do you belong to?',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: const Image(
                      image: AssetImage('assets/images/castle.png'))),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your Name:',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: TextField(
                  controller: txtController,
                  cursorColor: Colors.purple,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple))),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomBtn(onPress: () {
                Navigator.pushNamed(context, '/housedetails');
              })
            ],
          ),
        ),
      ),
    );
  }
}
