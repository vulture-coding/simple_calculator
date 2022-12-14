import 'package:flutter/material.dart';
import 'style.dart';
import 'main.dart';


class CustomKey extends StatelessWidget {
  final double size = 40;
  final String text;
  final dynamic function;
  final bool? isOperator;

  const CustomKey({
    super.key,
    required this.text,
    required this.function,
    this.isOperator
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isOperator ?? false ? darkMode ? Colors.blue: Colors.amber: null,
      margin: EdgeInsets.all(size / 15),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(size / 3)),
      elevation: size / 3,
      child: InkWell(
        onTap: function,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: customFontStyle(size: 10, lobster: true),
            ),
          ),
        ),
      ),
    );
  }
}
