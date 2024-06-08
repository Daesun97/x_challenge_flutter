import 'package:flutter/material.dart';
import 'package:x_challenge/constants/sizes.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.disabled,
    required this.text,
  });
  final String text;

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade400 : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: Text(
            style: const TextStyle(fontSize: Sizes.size28),
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
