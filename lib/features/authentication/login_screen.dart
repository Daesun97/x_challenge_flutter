import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/inital_screen.dart';
import 'package:x_challenge/features/widget/authbutton.dart';
import 'package:x_challenge/features/widget/linewirhtext.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void onSignupTap(BuildContext context) {
    //유저가 보고있는 현제 페이지를 날림
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InitialScreen(),
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
              Gaps.v80,
              const Text(
                'X에 로그인하세요',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              const Text(
                '설정을 체크하고, 세상에 일어나는 모든 일을 보세요!',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v80,
              Gaps.v28,
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
                child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.solidUser),
                    text: '전화번호 혹은 이메일'),
              ),
              Gaps.v24,
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.envelope), text: 'Email로 로그인'),
              Gaps.v80,
              Gaps.v80,
              const DividerWithText(
                text: '또는',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '계정이 없나요?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => onSignupTap(context),
              child: Text(
                '계정 가입',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
