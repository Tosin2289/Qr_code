// ignore_for_file: public_member_api_docs, sort_constructors_first
class Code {
  String Fname;
  String Lname;
  String Email;
  String Phone;
  String Whatsapp;
  String Total;
  String SpouseName;
  String NannyName;
  String ChildOne;
  String ChildTwo;
  String ChildThree;
  String ChildFour;
  String Five;
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
    required this.Five,
  });
  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      Fname: json['Fname'] ?? "",
      Lname: json['Lname'] ?? "",
      Email: json['Email'] ?? "",
      Phone: json['Phone'] ?? "",
      Whatsapp: json['Whatsapp'] ?? "",
      Total: json['Total'] ?? "",
      SpouseName: json['SpouseName'] ?? "",
      NannyName: json['NannyName'] ?? "",
      ChildOne: json['ChildOne'] ?? "",
      ChildTwo: json['ChildTwo'] ?? "",
      ChildThree: json['ChildThree'] ?? "",
      ChildFour: json['ChildFour'] ?? "",
      Five: json['Five'] ?? "",
    );
  }
}
