import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/onboarding/interests_screen.dart';
import 'package:x_challenge/features/widget/next_button.dart';

class ConsentScreen extends StatefulWidget {
  const ConsentScreen({super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool _isSwitched = false;

  void _tapBlackButton() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                '당신의 경험에 맞게 알려 드릴게요!',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Sizes.size36),
              ),
              Gaps.v56,
              const Text(
                'X에서의 경험을 통해 X는 당신의 관심사를 학습합니다.',
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.bold),
              ),
              Gaps.v56,
              Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: Text(
                      'X는 이 데이터를 사용하여 당신의 경험을 개인화시키고 고도화 시켜드려요!, 이 브라우징 기록들은 귀하의 이름, 이메일 또는 전화번호로 저장되지 않습니다.',
                      style: TextStyle(fontSize: Sizes.size16),
                    ),
                  ),
                  Gaps.h16,
                  Flexible(
                    flex: 1,
                    child: Switch(
                      activeColor: Theme.of(context).primaryColor,
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 100,
        child: GestureDetector(
            onTap: _tapBlackButton,
            child: NextButton(
              disabled: !_isSwitched,
              text: 'Sign up',
            )),
      ),
    );
  }
}
