import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_app/view/home_screen.dart';
import 'package:memes_app/view/provider/memes_provider.dart';
import 'package:memes_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>MemesProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),

    );
  }
}
