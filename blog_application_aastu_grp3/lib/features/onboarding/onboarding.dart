import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

// Material(
//   child: Container(
//     margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
//     height: 300,
//     child: Image.asset('assets/images/onboarding_image.png'),
//   ),
// ),
class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          dotsFlex: 1,
          done: Center(
              child: Text(
            'Get Started',
            style: TextStyle(color: Colors.white),
          )),
          showBackButton: false,
          next: Icon(Icons.arrow_forward_ios),
          nextStyle: IconButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Color.fromARGB(
                255,
                55,
                106,
                237,
              )),
          onDone: () {
            print('done');
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(30.0, 10.0),
            activeColor: Color.fromARGB(
              255,
              55,
              106,
              237,
            ),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          doneStyle: TextButton.styleFrom(
            alignment: Alignment.centerRight,
            backgroundColor: Color.fromARGB(
              255,
              55,
              106,
              237,
            ),
          ),
          pages: [
            PageViewModel(
                // body: 'awfkdfjl',

                title: '',
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 500, // Set the desired width
                      height: 300, // Set the desired height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image:
                              AssetImage("assets/images/onboarding_image.png"),
                        ),
                      ),
                    ),
                    Text(
                      'Read the article you want instantly',
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.')
                  ],
                )),
            PageViewModel(
                // body: 'awfkdfjl',

                title: '',
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 500, // Set the desired width
                      height: 300, // Set the desired height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image:
                              AssetImage("assets/images/onboarding_image.png"),
                        ),
                      ),
                    ),
                    Text(
                      'Read the article you want instantly',
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.')
                  ],
                )),
            PageViewModel(
                // body: 'awfkdfjl',

                title: '',
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 500, // Set the desired width
                      height: 300, // Set the desired height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image:
                              AssetImage("assets/images/onboarding_image.png"),
                        ),
                      ),
                    ),
                    Text(
                      'Read the article you want instantly',
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.')
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
