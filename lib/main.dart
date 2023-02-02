import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_video/allhero_screen.dart';
import 'package:map_video/floor_screen.dart';
import 'package:map_video/home_screen.dart';
import 'package:map_video/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/floor1': (context) => const FloorScreen(),
        '/floor1/allhero': (context) => const AllHeroScreen(),
        '/video': (context) => const VideoScreen()
      },
      initialRoute: '/',
    );
  }
}
