import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
            imageUrl:"https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,

                ),
              ),
            ),
            placeholder: (context, url) => Center(child:CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "UnSad App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
        ],
      ),
    );
  }
}
