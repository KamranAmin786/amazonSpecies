import 'package:africa/app_utils/utilities.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  int gridColumn = 1;
  String selectedAnimal = "assets/Hero/anaconda.jpg";

  List<Map<String, dynamic>> animalList = [];

  @override
  void initState() {
    super.initState();
    loadJsonData('assets/data/animals.json').then((data) {
      if (data != null) {
        setState(() {
          animalList = data;
          selectedAnimal =  "assets/Hero/${animalList[0]['image']}.jpg";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  colorBlack.withOpacity(0.7),
      appBar: AppBar(
        foregroundColor: colorWhite,
        title: const Text("Gallery View"),
        backgroundColor:  colorBlack.withOpacity(0.7),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0,),
            ClipOval(
              child: Image.asset(
                selectedAnimal,
                fit: BoxFit.cover,
                width: 280,
                height: 280,
              ),
            ),

            Slider(
              value: gridColumn.toDouble(),
              min: 1,
              max: 3,
              activeColor: colorLightGreen,
              divisions: 2,
              onChanged: (value) {
                setState(() {
                  gridColumn = value.toInt();
                });
              },
            ),

            // Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridColumn, // Change this as needed
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = "assets/Hero/${animalList[index]['image']}.jpg";
                        });
                      },
                      child: Material(
                        elevation: 5.0,
                        child: Image.asset(
                          "assets/Hero/${animalList[index]['image']}.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  itemCount: animalList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}