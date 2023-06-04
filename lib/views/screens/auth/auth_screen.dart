import 'package:dog/views/global_components/k_button.dart';
import 'package:dog/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            stops: [0.20, 0.92],
            colors: [
              Color(0xFF4596EA),
              Color(0xFF4552CB),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: KSize.getHeight(context, 128),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Welcome\nto ',
                    style: KTextStyle.headline3.copyWith(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: KColor.white),
                  ),
                  TextSpan(
                    text: 'Pet Care',
                    style: KTextStyle.headline3.copyWith(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: KColor
                            .yellowColor), // replace with the color you want
                  ),
                ],
              ),
            ),
            Container(
              height: KSize.getHeight(context, 30),
            ),
            KButton(
              isPrefixIcon: true,
              prefixIcon: Icon(
                Icons.facebook_rounded,
                color: KColor.violet,
              ),
              text: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Continue with ',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: KColor.violet),
                    ),
                    TextSpan(
                      text: 'Facebook',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                              KColor.violet), // replace with the color you want
                    ),
                  ],
                ),
              ),
              txtcolor: KColor.black,
              containerColor: KColor.white,
              borderColor: KColor.white,
              kbuttonTap: () {},
              getHeight: 46,
              getWidth: MediaQuery.of(context).size.width - 50,
            ),
            Container(
              height: KSize.getHeight(context, 20),
            ),
            KButton(
              isPrefixIcon: true,
              prefixIcon: Icon(
                Icons.email,
                color: KColor.violet,
              ),
              text: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Continue with ',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: KColor.violet),
                    ),
                    TextSpan(
                      text: 'Google     ',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                              KColor.violet), // replace with the color you want
                    ),
                  ],
                ),
              ),
              txtcolor: KColor.black,
              containerColor: KColor.white,
              borderColor: KColor.white,
              kbuttonTap: () {},
              getHeight: 46,
              getWidth: MediaQuery.of(context).size.width - 50,
            ),
            Container(
              height: KSize.getHeight(context, 50),
            ),
            KButton(
              text: Text(
                "Register With Email",
                style: KTextStyle.bodyText1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: KColor.white),
              ),
              txtcolor: KColor.black,
              containerColor: KColor.transparent,
              borderColor: KColor.white,
              kbuttonTap: () {},
              getHeight: 46,
              getWidth: MediaQuery.of(context).size.width - 50,
            ),
            Container(
              height: KSize.getHeight(context, 100),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Already have an account? ',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: KColor.white),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: KTextStyle.bodyText1.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                              KColor.white), // replace with the color you want
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
