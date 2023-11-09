import 'package:africa/app_utils/utilities.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBlack,
      body: Center(
        child: Text("Map View",style: TextStyle(color: colorWhite),),
      ),
    );
  }
}