import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/sizes.dart';

class FinalAuthScreen extends StatelessWidget {
  const FinalAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FaIcon(
          FontAwesomeIcons.xTwitter,
          size: Sizes.size96,
        ),
      ),
    );
  }
}
