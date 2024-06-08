import 'package:flutter/material.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/onboarding/interests_screen.dart';
import 'package:x_challenge/features/onboarding/widgets/interest_button.dart';

class InterestDetail extends StatefulWidget {
  final List<String> interest;
  const InterestDetail({super.key, required this.interest});

  @override
  State<InterestDetail> createState() => _InterestDetailState();
}

class _InterestDetailState extends State<InterestDetail> {
  List<String> userInterests = [];

  void _selectInterest(isSelected, interest) {
    if (isSelected) {
      userInterests.add(interest);
    } else {
      userInterests.remove(interest);
    }
    setState(() {});
    print(userInterests);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 1,
            height: 0.8,
            color: Colors.grey.shade400,
          ),
          Gaps.v32,
          Text(
            widget.interest.first,
            style: const TextStyle(
                fontSize: Sizes.size32, fontWeight: FontWeight.bold),
          ),
          Gaps.v20,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1200,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 15,
                runSpacing: 15,
                children: [
                  for (var i in widget.interest)
                    InterestButton(interest: i, selectInterest: _selectInterest)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
