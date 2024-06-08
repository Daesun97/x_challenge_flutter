import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/create_account_screen.dart';
import 'package:x_challenge/features/authentication/login_screen.dart';
import 'package:x_challenge/features/widget/authbutton.dart';
import 'package:x_challenge/features/widget/blackbutton.dart';
import 'package:x_challenge/features/widget/linewirhtext.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void _blackButtonTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAcoountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.xTwitter,
          size: Sizes.size44,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v72,
              const Text(
                'X. 지금 일어나고 있는 일',
                style: TextStyle(
                  fontSize: Sizes.size48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gaps.v96,
              const AuthButton(
                text: 'email로 가입하기',
                icon: FaIcon(FontAwesomeIcons.google),
              ),
              Gaps.v24,
              const AuthButton(
                text: 'APPLE로 가입하기',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
              Gaps.v96,
              const DividerWithText(text: '또는'),
              Gaps.v14,
              GestureDetector(
                onTap: () => _blackButtonTap(context),
                child: const BlackButton(
                  text: '이메일로 계정 만들기',
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '이미 계정이 있나요?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onLoginTap(context),
              child: Text(
                '로그인',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
