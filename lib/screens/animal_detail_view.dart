import 'package:africa/app_utils/utilities.dart';
import 'package:flutter/material.dart';

class AnimalDetailView extends StatefulWidget {
  const AnimalDetailView({super.key, required this.animalDetails});

  final Map<String, dynamic> animalDetails;

  @override
  State<AnimalDetailView> createState() => _AnimalDetailViewState();
}

class _AnimalDetailViewState extends State<AnimalDetailView> {
  @override
  void initState() {
    super.initState();
  }
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: colorWhite.withOpacity(0.3),
        foregroundColor: colorWhite,
        title: Text(
          "Learn about ${widget.animalDetails['name']}",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO IMAGE
            Image.asset(
              "assets/Hero/${widget.animalDetails['image']}.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.animalDetails['name'].toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                color: colorWhite,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: colorYellowAccent,
                decorationThickness: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.animalDetails['headline'],
                style: const TextStyle(
                  fontSize: 18,
                  color: colorYellowAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.perm_media_outlined,
                  color: colorYellowAccent,
                  size: 31,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Wilderness in Pictures",
                  style: TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/gallery/${widget.animalDetails['image']}/${widget.animalDetails['image']}-${index + 1}.jpg",
                        ),
                      ),
                    );
                  },
                  itemCount: widget.animalDetails["gallery"].length,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: colorYellowAccent,
                  size: 31,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Did you know ?",
                  style: TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 168,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: colorBlack.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                widget.animalDetails["fact"][index],
                                style: const TextStyle(
                                  color: colorWhite,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.animalDetails["fact"].length,
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
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.description,
                  color: colorYellowAccent,
                  size: 31,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "All about ${widget.animalDetails['name']}?",
                  style: const TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.animalDetails['description'],
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: colorWhite,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        widget.animalDetails["fact"].length,
        (index) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? colorWhite : colorGrey.withOpacity(0.6),
            ),
          );
        },
      ),
    );
  }
}
