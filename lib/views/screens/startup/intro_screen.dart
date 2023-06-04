import 'package:dog/constants/asset_path.dart';
import 'package:dog/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../services/navigation_service.dart';
import '../auth/auth_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();
  double? dotRowWidth;
  int currentPage = 0;
  List<String> imageList = [
    AssetPath.introImageOne,
    AssetPath.introImageTwo,
    AssetPath.introImageThree
  ];
  List<String> textHeadList = [
    'Welcome to Pet Care',
    'Proven Experts',
    'Reliable Reviews'
  ];
  List<String> textSubList = [
    'All types of services for your pet in one\nplace, instantly searchable.',
    'We interview every specialist before\nthey get to work.',
    'A review can be left only by a user\nwho used the service.'
  ];

  @override
  Widget build(BuildContext context) {
    if (dotRowWidth == null) {
      Future.delayed(Duration.zero, () {
        setState(() {
          dotRowWidth = _calculateDotRowWidth();
        });
      });
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                Positioned(
                  top: KSize.getHeight(context, 500),
                  left: dotRowWidth != null
                      ? (MediaQuery.of(context).size.width - dotRowWidth!) / 2
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((url) {
                      int index = imageList.indexOf(url);
                      return Container(
                        width: currentPage == index ? 22.0 : 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: currentPage == index
                            ? ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: KColor.orangeColor,
                              )
                            : ShapeDecoration(
                                shape: CircleBorder(),
                                color: KColor.greyColor,
                              ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: PageView.builder(
                    controller: controller,
                    itemCount: imageList.length,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 400,
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        imageList[index],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 100,
                              // color: Colors.black,
                            ),
                            Text(
                              textHeadList[index],
                              style: KTextStyle.headline5
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: 10,
                              // color: Colors.black,
                            ),
                            Text(
                              textSubList[index],
                              style: KTextStyle.subtitle1
                                  .copyWith(fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: 260,
                height: 46,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Provide a value for the border radius
                      ),
                    ),
                  ),
                  child: Text(
                      currentPage == imageList.length - 1 ? 'Finish' : 'Next'),
                  onPressed: () {
                    if (currentPage == imageList.length - 1) {
                      Navigator.push(
                        context,
                        FadeRoute(page: AuthScreen()),
                      );
                    } else {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateDotRowWidth() {
    return (imageList.length * 8.0) + // width of each dot
        ((imageList.length - 1) * 4.0) + // total space between dots
        (2 * 2.0); // margin at the ends
  }
}
