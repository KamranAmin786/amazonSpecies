import 'package:africa/app_utils/utilities.dart';
import 'package:africa/screens/video_player_screen.dart';
import 'package:flutter/material.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({super.key});

  @override
  State<VideoListView> createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  List<Map<String, dynamic>> videoList = [];

  @override
  void initState() {
    super.initState();
    loadJsonData('assets/data/videos.json').then((data) {
      if (data != null) {
        setState(() {
          videoList = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack.withOpacity(0.7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/VideoCover/video-${videoList[index]['id']}.jpg",
                              height: 80,
                              width: 120.0,
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              top: 0.0,
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Icon(
                                Icons.play_circle_outline,
                                color: colorWhite,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              videoList[index]['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    colorLightGreen, // Replace with your desired color
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              videoList[index]['headline'],
                              style: const TextStyle(
                                fontSize: 12,
                                color:
                                    colorWhite, // Replace with your desired color
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined,color: colorWhite,size: 16,),
                      const SizedBox(width: 10),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(video: "assets/Video/${videoList[index]['id']}.mp4")));
                  },
                ),
                 Divider(color: colorGrey.withOpacity(0.2),),
              ],
            );
          },
          itemCount: videoList.length,
        ),
      ),
    );
  }
}
