import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  bool isLastPage = false;
  List<OnBoardingPageWidget> pages = const [
    OnBoardingPageWidget(
      title: 'Title1',
      subTitle: 'SubTitle1',
      image: 'assets/finance1.png',
    ),
    OnBoardingPageWidget(
      title: 'Title2',
      subTitle: 'SubTitle2',
      image: 'assets/finance2.png',
    ),
    OnBoardingPageWidget(
      title: 'Title3',
      subTitle: 'SubTitle3',
      image: 'assets/finance3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Skip')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (pages.length == value + 1) {
                    isLastPage = true;
                  }
                  currentPage = value;
                  setState(() {});
                },
                itemCount: pages.length,
                controller: pageController,
                itemBuilder: (context, index) => pages[index],
              ),
            ),
            Row(
              children: [
                Text(
                  '${currentPage + 1}/${pages.length}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryPurbleColor,
                  ),
                ),
                const Spacer(),
                isLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: kPrimaryPurbleColor,
                        ),
                        child: const Text(
                          "Let's Start",
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 50,
                          color: kPrimaryPurbleColor,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 33,
            color: kPrimaryPurbleColor,
          ),
        ),
        Image.asset(
          image,
          width: double.infinity,
        ),
        Text(subTitle),
      ],
    );
  }
}
