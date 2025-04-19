import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: 'Welcome to Goldfish!',
      description:
          'Goldfish was created to instill a more fun and engaging work culture.',
      imagePath: 'assets/image1.png',
    ),
    OnboardingPage(
      title: 'Achieve Your Goals',
      description:
          'Get rewarded with coins for reaching your sales goals, taking a daily quiz, or just showing up on time for work.',
      imagePath: 'assets/image2.png',
    ),
    OnboardingPage(
      title: 'Treat Yourself',
      description:
          'Cash in those hard-earned coins for real world rewards like gift cards or even a laptop.',
      imagePath: 'assets/image3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: onboardingPages.length,
        itemBuilder: (context, index) {
          return buildPage(onboardingPages[index]);
        },
      ),
      bottomSheet: buildBottomSheet(),
    );
  }

  Widget buildPage(OnboardingPage page) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(page.imagePath, height: 300),
          SizedBox(height: 30),
          Text(
            page.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              page.description,
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _pageController.jumpToPage(onboardingPages.length - 1);
            },
            child: Text('Skip'),
          ),
          Row(
            children: List.generate(onboardingPages.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.orange
                      : Colors.grey,
                ),
              );
            }),
          ),
          TextButton(
            onPressed: () {
              if (_currentPage == onboardingPages.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Text(_currentPage == onboardingPages.length - 1 ? 'Sign In' : 'Next'),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Center(child: Text('Sign In Screen')),
    );
  }
}