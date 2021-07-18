import 'package:flutter/material.dart';

class TextBoxBtnWidget extends StatelessWidget {
  TextBoxBtnWidget({
    required this.label,
    required this.textBoxColor,
    required this.textColor,
    this.textSize=18,
    required this.onPressedBtn,
  });

  final String label;
  final Color textBoxColor;
  final Color textColor;
  final double textSize;
  final VoidCallback onPressedBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 5.0,
        color: textBoxColor,
        borderRadius: BorderRadius.circular(30.0),
        child: TextButton(
          onPressed: onPressedBtn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedBtnWidget extends StatelessWidget {
  ElevatedBtnWidget({
    required this.label,
    required this.textBoxColor,
    required this.textColor,
    this.textSize=15,
    required this.onPressedBtn,
  });

  final String label;
  final Color textBoxColor;
  final Color textColor;
  final double textSize;
  final VoidCallback onPressedBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 5.0,
        color: textBoxColor,
        borderRadius: BorderRadius.circular(30.0),
        child: ElevatedButton(
          onPressed: onPressedBtn,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
