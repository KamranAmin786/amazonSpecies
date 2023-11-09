import 'package:africa/app_utils/utilities.dart';
import 'package:africa/screens/animal_detail_view.dart';
import 'package:africa/widget/cover_image_view.dart';
import 'package:flutter/material.dart';

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  List<Map<String, dynamic>> animalList = [];
  // String toolbarIcon = "square.grid.2x2";
  bool isGridViewActive = false;
  int elements = 1;

  void gridSwitch() {
    setState(() {
      isGridViewActive = true;
    });
    if (elements == 1){
      setState(() {
        elements = 2;
      });
    }else if (elements == 2){
      elements = 1;
    }
  }

  @override
  void initState() {
    super.initState();
    loadJsonData('assets/data/animals.json').then((data) {
      if (data != null) {
        setState(() {
          animalList = data;
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
        backgroundColor:  colorBlack.withOpacity(0.7),
        title: const Text("Africa"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridViewActive = false;
              });
            },
            icon: const Icon(
              Icons.view_list,
              size: 26,
              color: colorWhite,
            ),
          ),
          IconButton(
            onPressed: () {
              gridSwitch();
            },
            icon: Icon(
              elements == 2 ? Icons.grid_on : Icons.grid_view_outlined,
              color: elements == 2 ? Colors.teal : colorYellowAccent,
            ),
          ),
        ],
      ),
      body: isGridViewActive
          ? GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: elements, // Change this as needed
          childAspectRatio: 1.0,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalDetailView(animalDetails: animalList[index])));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "assets/Hero/${animalList[index]['image']}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: animalList.length,
      )
          :  Column(
        children: [
          const CoverImageView(),
          const SizedBox(height: 10.0,),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
                child: GestureDetector(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          "assets/Hero/${animalList[index]['image']}.jpg",
                          height: 90,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              animalList[index]['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    colorLightGreen, // Replace with your desired color
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              animalList[index]['headline'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: colorWhite, // Replace with your desired color
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalDetailView(animalDetails: animalList[index])));
                  },
                ),
              );
            },
            itemCount: animalList.length,
          )),
        ],
      ),
    );
  }
}
