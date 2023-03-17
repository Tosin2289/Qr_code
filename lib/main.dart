import 'package:flutter/material.dart';
import 'package:qrcode/pages/generator.dart';
import 'package:qrcode/pages/generator_image.dart';
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
        primarySwatch: Colors.green,
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
  List pages = [
    Generator(),
    Scanner(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: currentindex,
        onTap: ((selectedindex) {
          setState(() {
            currentindex = selectedindex;
          });
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code,
              ),
              label: 'Generator'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
              ),
              label: 'Scanner'),
        ],
      ),
      body: pages[currentindex],
    );
  }
}
