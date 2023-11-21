// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerScreen extends StatefulWidget {
  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: qrData.isNotEmpty
                      ? parseQRDatas(qrData)
                      : Text("Scan qr code")),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrData = scanData.code!;
      });
    });
  }

  String parseQRData(String qrData) {
    try {
      final decodedData = json.decode(qrData);
      final code = Code.fromJson(decodedData);

      return '''
        First Name: ${code.Fname},
        Last Name: ${code.Lname},
        Email: ${code.Email},
        Phone: ${code.Phone},
        WhatsApp: ${code.Whatsapp},
        Total: ${code.Total},
        Spouse Name: ${code.SpouseName},
        Nanny Name: ${code.NannyName},
    
      ''';
    } catch (e) {
      return e.toString();
    }
  }
}

Widget parseQRDatas(String qrData) {
  try {
    final decodedData = json.decode(qrData);
    final code = Code.fromJson(decodedData);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyRichText(
            title: "First Name :",
            value: code.Fname.toString(),
          ),
          MyRichText(
            title: "Last Name :",
            value: code.Lname.toString(),
          ),
          MyRichText(
            title: "Email:",
            value: code.Email.toString(),
          ),
          MyRichText(
            title: "Phone :",
            value: code.Phone.toString(),
          ),
          MyRichText(
            title: "Whatsapp :",
            value: code.Whatsapp.toString(),
          ),
          MyRichText(
            title: "Reservations :",
            value: code.Total.toString(),
          ),
          MyRichText(
            title: "Spouse Name :",
            value: code.SpouseName.toString(),
          ),
          MyRichText(
            title: "Nanny Name :",
            value: code.NannyName.toString(),
          ),
          MyRichText(
            title: "Child one :",
            value: code.ChildOne.toString(),
          ),
          MyRichText(
            title: "Child Two :",
            value: code.ChildTwo.toString(),
          ),
          MyRichText(
            title: "Child Three :",
            value: code.ChildThree.toString(),
          ),
          MyRichText(
            title: "Child Four :",
            value: code.ChildFour.toString(),
          ),
          MyRichText(
            title: "Child Five :",
            value: code.ChildFive.toString(),
          ),
          MyRichText(
            title: "Child Six :",
            value: code.ChildSix.toString(),
          )
        ],
      ),
    );
  } catch (e) {
    return Text("Invalid Format");
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class Code {
  String? Fname;
  String? Lname;
  String? Email;
  String? Phone;
  String? Whatsapp;
  int? Total;
  String? SpouseName;
  String? NannyName;
  String? ChildOne;
  String? ChildTwo;
  String? ChildThree;
  String? ChildFour;
  String? ChildFive;
  String? ChildSix;

  Code({
    required this.Fname,
    required this.Lname,
    required this.Email,
    required this.Phone,
    required this.Whatsapp,
    required this.Total,
    required this.SpouseName,
    required this.NannyName,
    required this.ChildOne,
    required this.ChildTwo,
    required this.ChildThree,
    required this.ChildFour,
    required this.ChildFive,
    required this.ChildSix,
  });

  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      Fname: json['FName'],
      Lname: json['LName'],
      Email: json['Email'],
      Phone: json['Phone'],
      Whatsapp: json['Whatsapp'],
      Total: json['Total'],
      SpouseName: json['SpouseName'],
      NannyName: json['NannyName'],
      ChildOne: json['ChildOne'],
      ChildTwo: json['ChildTwo'],
      ChildThree: json['ChildThree'],
      ChildFour: json['ChildFour'],
      ChildFive: json['ChildFive'],
      ChildSix: json['ChildSix'],
    );
  }
}
