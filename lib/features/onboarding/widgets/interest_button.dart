import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  final String interest;

  final Function selectInterest;
  const InterestButton({
    super.key,
    required this.interest,
    required this.selectInterest,
  });

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.selectInterest(_isSelected, widget.interest);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        width: 150,
        height: 80,
        duration: const Duration(microseconds: 300),
        padding: const EdgeInsets.only(
            left: Sizes.size10,
            right: Sizes.size3,
            bottom: Sizes.size3,
            top: Sizes.size3),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size10),
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        child: Stack(children: [
          Container(
              alignment: Alignment.topRight,
              child: const FaIcon(
                FontAwesomeIcons.circleCheck,
                color: Colors.white,
              )),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.interest,
              style: TextStyle(
                  fontSize: Sizes.size16,
                  color: _isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
