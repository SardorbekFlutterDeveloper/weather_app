import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomPoint extends StatefulWidget {
  const CustomPoint({super.key});

  @override
  State<CustomPoint> createState() => _CustomPointState();
}

class _CustomPointState extends State<CustomPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(300, 200),
         
      ),
    );
  }
}