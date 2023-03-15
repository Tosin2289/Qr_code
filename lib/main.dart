import 'package:flutter/material.dart';
import 'package:qrcode/pages/generator.dart';
import 'package:qrcode/pages/scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  List pages = [Generator(), Scanner()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: ((selectedindex) {
          setState(() {
            currentindex = selectedindex;
          });
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.generating_tokens,
              ),
              label: 'generator'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_enhance_outlined,
              ),
              label: 'Scanner'),
        ],
      ),
      body: pages[currentindex],
    );
  }
}
