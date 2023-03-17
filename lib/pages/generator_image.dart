import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ImageGenerator extends StatefulWidget {
  ImageGenerator({Key? key}) : super(key: key);

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  File? file;
  ImagePicker image = ImagePicker();
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: QrImage(
                      embeddedImage: FileImage(file!),
                      data: data,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(50, 50),
                      ),
                      backgroundColor: Colors.white,
                      size: 250,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8)),
                      child: file == null
                          ? Icon(
                              Icons.image,
                              size: 50,
                            )
                          : Image.file(file!, fit: BoxFit.fill)),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: getGall,
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          "Upload Image",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getGall() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
