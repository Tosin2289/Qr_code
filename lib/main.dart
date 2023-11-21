import 'package:flutter/material.dart';
import 'package:qrcode/pages/generator.dart';

import 'package:qrcode/pages/scanner.dart';
import 'package:qrcode/pages/spec1.dart';

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
        useMaterial3: true,
      ),
      home: QRCodeScannerScreen(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentindex = 0;
//   List pages = [Generator(), Scanner(), QRCodeScannerScreen()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         currentIndex: currentindex,
//         onTap: ((selectedindex) {
//           setState(() {
//             currentindex = selectedindex;
//           });
//         }),
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.qr_code,
//               ),
//               label: 'Generator'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.qr_code_scanner,
//               ),
//               label: 'Scanner'),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.code,
//               ),
//               label: 'Format'),
//         ],
//       ),
//       body: pages[currentindex],
//     );
//   }
// }
