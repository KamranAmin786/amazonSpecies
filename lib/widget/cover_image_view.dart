import 'package:africa/app_utils/utilities.dart';
import 'package:flutter/material.dart';

class CoverImageView extends StatefulWidget {
  const CoverImageView({super.key,});


  @override
  State<CoverImageView> createState() => _CoverImageViewState();
}

class _CoverImageViewState extends State<CoverImageView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 280,
          child: PageView.builder(
            itemBuilder: (context, index) {
              print(coverImages[index]);
              return Image.asset(
                "assets/cover/${coverImages[index]}",
                fit: BoxFit.fill,
              );
            },
            itemCount: coverImages.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 10.0,
          child: buildPageIndicator(),
        ),
      ],
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        coverImages.length,
        (index) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? colorWhite : colorBlack,
            ),
          );
        },
      ),
    );
  }
}
