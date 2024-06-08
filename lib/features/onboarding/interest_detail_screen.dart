import 'package:flutter/material.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/final_auth_screen.dart';
import 'package:x_challenge/features/onboarding/widgets/interest_detail.dart';
import 'package:x_challenge/features/widget/next_button.dart';

class InterestDetailScreen extends StatefulWidget {
  const InterestDetailScreen({super.key});

  @override
  State<InterestDetailScreen> createState() => _InterestDetailScreenState();
}

class _InterestDetailScreenState extends State<InterestDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FinalAuthScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text(
            '당신의 관심사는 뭔가요?',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v40,
              const Text(
                'X에서 뭘 보고 싶나요?',
                style: TextStyle(
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              const Text(
                '콕 찝어서 골라주시면, 그걸로 추천해 드릴게요!',
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              InterestDetail(
                interest: _musics,
              ),
              InterestDetail(
                interest: _cars,
              ),
              InterestDetail(
                interest: _foods,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 120,
        elevation: 0.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: GestureDetector(
                onTap: _onNextButtonTap,
                child: Container(
                    height: 80,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size32),
                    ),
                    child: const NextButton(disabled: false, text: '다음')),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> _musics = [
  "음악",
  "Rap",
  "R&B & soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Reggae"
];

final List<String> _cars = [
  "자동차",
  "밴츠",
  "아우디",
  "BMW",
  "현대",
  "기아",
  "도요타",
  "닛산",
  "쉐보레",
  "테슬라",
  "포드"
];

final List<String> _foods = [
  "음식",
  "한식",
  "일식",
  "중식",
  "양식",
  "베트남식",
  "태국식",
  "아랍식",
  "중앙아시아식",
  "아프리카식",
  "남미식"
];
