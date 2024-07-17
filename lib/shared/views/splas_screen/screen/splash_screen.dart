import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Entry(
                // xOffset: -1000,
                yOffset: -100,
                scale: 1,
                delay: const Duration(seconds: 0),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: const CustomCard("Example 1"),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }
}

/// Custom card used for every example
class CustomCard extends StatelessWidget {
  const CustomCard(this.label, {Key? key}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: 128,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
