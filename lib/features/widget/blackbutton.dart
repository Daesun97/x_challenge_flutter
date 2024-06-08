import 'package:flutter/material.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';

class BlackButton extends StatelessWidget {
  final String text;
  const BlackButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    //부모의 크기에 비례해서 크기를 정해주는 위젯
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Sizes.size28),
          border: Border.all(
            color: Colors.black,
            width: Sizes.size1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gaps.h12,
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
