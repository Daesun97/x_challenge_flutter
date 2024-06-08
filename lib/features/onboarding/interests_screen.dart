import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/onboarding/interest_detail_screen.dart';
import 'package:x_challenge/features/onboarding/widgets/interest_button.dart';
import 'package:x_challenge/features/widget/next_button.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;
  List<String> userInterests = [];

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

  void _selectInterest(isSelected, interest) {
    if (isSelected) {
      userInterests.add(interest);
    } else {
      userInterests.remove(interest);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const InterestDetailScreen(),
    ));
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
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                '3개이상 골라 주세요, 그걸로 추천해 드릴게요!',
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              Gaps.v52,
              Wrap(
                runSpacing: 15,
                spacing: 25,
                children: [
                  for (var interest in interests)
                    InterestButton(
                      interest: interest,
                      selectInterest: _selectInterest,
                    ),
                ],
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
                child: (userInterests.length > 2)
                    ? const Text(
                        "고마워용 🙆‍♀️",
                        style: TextStyle(fontSize: Sizes.size24),
                      )
                    : Text("3개 중 ${userInterests.length}개 선택했어요!"),
              ),
              GestureDetector(
                onTap: _onNextButtonTap,
                child: Container(
                    height: 80,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size32),
                    ),
                    child: const NextButton(disabled: false, text: '다음')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const interests = [
  "음악",
  "코미디",
  "엔터테인먼트",
  "동물",
  "음식",
  "뷰티 & 스타일",
  "드라마",
  "학습",
  "재능",
  "스포츠",
  "자동차",
  "가족",
  "피트니스 & 건강",
  "DIY & 생활 해킹",
  "예술 & 공예",
  "춤",
  "야외 활동",
  "뭔가 만족스러운",
  "집 & 정원",
  "일상 생활",
  "코미디",
  "엔터테인먼트",
  "동물",
  "음식",
  "뷰티 & 스타일",
  "드라마",
  "학습",
  "재능",
  "스포츠",
  "자동차",
  "가족",
  "피트니스 & 건강",
  "DIY & 생활 해킹",
  "예술 & 공예",
  "춤",
  "야외 활동",
  "집 & 정원"
];
