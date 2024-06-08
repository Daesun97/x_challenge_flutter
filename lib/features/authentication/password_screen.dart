import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/consent_screen.dart';
import 'package:x_challenge/features/widget/next_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onTapNextButton() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ConsentScreen(),
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              '비밀번호를 만들어 주세요!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.size36),
            ),
            Gaps.v20,
            const Text(
              '비밀번호는 8글자 이상이어야 합니다',
              style: TextStyle(fontSize: Sizes.size20),
            ),
            Gaps.v32,
            TextField(
              obscureText: _obscureText,
              controller: _passwordController,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade400,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h14,
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size20,
                      color: _isPasswordValid()
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v80,
            GestureDetector(
                onTap: _onTapNextButton,
                child: NextButton(disabled: !_isPasswordValid(), text: '다음'))
          ],
        ),
      ),
    );
  }
}
