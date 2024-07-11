import 'package:flutter/material.dart';
import 'package:geolocalizacion_app/pages/global/ratio_calculator.dart';
import 'package:geolocalizacion_app/pages/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RatioCalculator ratioCalculator = RatioCalculator();
    ratioCalculator.updateRatio(
      context: context,
      figmaWidth: 390,
      figmaHeight: 844,
    );

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
