import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final VoidCallback onPressed;

  GradientButton({
    required this.child,
    required this.gradient,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            gradient: gradient,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(alignment: Alignment.center, child: child),
        ),
      ),
    );
  }
}
