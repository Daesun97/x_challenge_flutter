import 'package:flutter/material.dart';
import 'package:x_challenge/constants/sizes.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size24),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
