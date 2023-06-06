import 'package:eco_quest_vr/screens/auth_screens/login_screen.dart';
import 'package:eco_quest_vr/utils/dot_indicator.dart';
import 'package:eco_quest_vr/utils/on_board.dart';
import 'package:eco_quest_vr/utils/onboarding_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
//
// class MyPageView extends StatefulWidget {
//   @override
//   _MyPageViewState createState() => _MyPageViewState();
// }
//
// class _MyPageViewState extends State<MyPageView> {
//   final PageController _pageController = PageController();
//   final int desiredPageIndex =
//       2; // The page index at which you want to navigate to a new screen
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PageView Example'),
//       ),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (int index) {
//           if (index == desiredPageIndex) {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AnotherScreen()));
//           }
//         },
//         children: [
//           Container(color: Colors.red),
//           Container(color: Colors.green),
//           Container(color: Colors.blue),
//         ],
//       ),
//     );
//   }
// }
//
// class AnotherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Another Screen'),
//       ),
//       body: Center(
//         child: Text('Reached the desired page index!'),
//       ),
//     );
//   }
// }

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Color> colors = [
    const Color(0xFFDAD3C8),
    const Color(0xFFFFE5DE),
    const Color(0xFFDCF6E6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[pageIndex],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: demo_data.length,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    content: demo_data[index].content,
                    // color: colors[index],
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotIndicator(
                        isActive: index == pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  pageIndex + 1 == demo_data.length
                      ? Center(
                          child: SizedBox(
                            height: 60,
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => const LoginScreen()),
                                    (route) => false);
                              },
                              child: Text('Get Started'),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21),
                              )),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Onboard> demo_data = [
    Onboard(
        image: 'assets/climate.png',
        title: 'Journey into a\nSustainable World',
        content:
            'EcoQuest VR: Redefining Environmental Education in a climate change era.'),
    Onboard(
        image: 'assets/nature.png',
        title: 'Immerse Yourself in\nNature\'s Wonders',
        content:
            'Step into Virtual Reality and Explore the Wonders of Our Planet.'),
    Onboard(
        image: 'assets/vr.png',
        title: 'Inspiring Action for\na Greener Future',
        content:
            'Empowering Individuals to Fight Climate Change Through Virtual Reality Experiences.'),
  ];
}
