// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class Generator extends StatefulWidget {
//   const Generator({Key? key}) : super(key: key);

//   @override
//   State<Generator> createState() => _GeneratorState();
// }

// class _GeneratorState extends State<Generator> {
//   String data = '';
//   final TextEditingController _dataController = TextEditingController();
//   void _generateQRCode() {
//     setState(() {
//       data = _dataController.text;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 24,
//           ),
//           SizedBox(
//             width: 250,
//             child: TextField(
//               controller: _dataController,
//               onChanged: ((value) {
//                 setState(() {
//                   data = value;
//                 });
//               }),
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   hintText: 'Type the Data',
//                   filled: true,
//                   fillColor: Colors.grey[300]),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: _generateQRCode,
//             child: Text('Generate QR Code'),
//           ),
//           SizedBox(height: 20),
//           if (data.isNotEmpty)
//             QrImage(
//               data: data,
//               version: QrVersions.auto,
//               size: 200.0,
//             )
//           else
//             Container(),
//           RawMaterialButton(
//             shape: const StadiumBorder(),
//             fillColor: Colors.green,
//             padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
//             onPressed: _downloadQRCode,
//             child: Text(
//               "Download",
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _downloadQRCode() async {
//     if (data.isNotEmpty) {
//       final result =
//           await ImageGallerySaver.saveImage(Uint8List.fromList(QrPainter(
//         data: data,
//       ).toImageData(200, format: ui.ImageByteFormat.png).buffer.asUint8List()));
//       if (result['isSuccess']) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('QR Code saved to gallery'),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to save QR Code'),
//           ),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Generate a QR Code first'),
//         ),
//       );
//     }
//   }
// }
