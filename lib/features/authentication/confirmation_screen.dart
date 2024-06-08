import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/password_screen.dart';
import 'package:x_challenge/features/widget/next_button.dart';
import 'package:x_challenge/features/widget/pincodestate.dart';
import 'package:x_challenge/features/widget/pintextfield.dart';

class ConfirmationScreen extends StatefulWidget {
  final Map<String, String>? formData;
  const ConfirmationScreen({super.key, this.formData});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isCompleted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _isCompleted =
          Provider.of<PinCodeState>(context, listen: false).isCompleted;
    });
  }

  void _nextButtonTap() {
    setState(() {
      _isCompleted =
          Provider.of<PinCodeState>(context, listen: false).isCompleted;
    });
    if (!_isCompleted) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.xTwitter,
          size: Sizes.size44,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            Text(
              '코드를 보내드렸어요!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.size36),
            ),
            Gaps.v32,
            Text(
              '메일을 확인해 보세요',
              style: TextStyle(
                fontSize: Sizes.size20,
              ),
            ),
            Gaps.v10,
            Text(
              //Formkey로 정보 받아오는 방식이 잘못댔나? null값이 나온다
              // "${widget.formData?['email']}",
              'dbseotjs@naver.com',
              style: TextStyle(
                fontSize: Sizes.size20,
              ),
            ),
            Gaps.v48,
            PinCodeFieldWidget(
              length: 4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        elevation: 0,
        child: GestureDetector(
          onTap: _nextButtonTap,
          child: NextButton(disabled: !_isCompleted, text: '다음'),
        ),
      ),
    );
  }
}
