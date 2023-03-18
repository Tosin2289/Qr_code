import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generator extends StatefulWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  String data = '';
  void saveimage() async {
    try {
      String pat = "assets/icon.jpg";
      final path = QrImage(
        data: data,
        embeddedImage: AssetImage("assets/icon.jpg"),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(30, 30),
        ),
        backgroundColor: Colors.white,
        size: 250,
      ).toString();
      String album = 'QR';
      GallerySaver.saveImage(pat, albumName: album)
          .then((success) => setState(() {
                print('Image is saved');
              }));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Image Saved"),
        backgroundColor: Colors.grey,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Download fail"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: QrImage(
                embeddedImage: AssetImage("assets/icon.jpg"),
                data: data,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(30, 30),
                ),
                backgroundColor: Colors.white,
                size: 250,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              onChanged: ((value) {
                setState(() {
                  data = value;
                });
              }),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: 'Type the Data',
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RawMaterialButton(
            shape: const StadiumBorder(),
            fillColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            onPressed: saveimage,
            child: Text(
              "Download",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
