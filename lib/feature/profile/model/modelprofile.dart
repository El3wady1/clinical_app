import 'dart:convert';
/// name : ""
/// age : ""
/// email : ""
/// gander : ""
/// phone : ""
/// adress : ""
/// date : ""
/// userid : ""

Modelprofile modelprofileFromJson(String str) => Modelprofile.fromJson(json.decode(str));
String modelprofileToJson(Modelprofile data) => json.encode(data.toJson());
class Modelprofile {
  Modelprofile({
      this.name, 
      this.age, 
      this.email, 
      this.gander, 
      this.phone, 
      this.adress, 
      this.date, 
      this.userid,});

  Modelprofile.fromJson(dynamic json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
    gander = json['gander'];
    phone = json['phone'];
    adress = json['adress'];
    date = json['date'];
    userid = json['userid'];
  }
  String? name;
  String? age;
  String? email;
  String? gander;
  String? phone;
  String? adress;
  String? date;
  String? userid;
Modelprofile copyWith({  String? name,
  String? age,
  String? email,
  String? gander,
  String? phone,
  String? adress,
  String? date,
  String? userid,
}) => Modelprofile(  name: name ?? this.name,
  age: age ?? this.age,
  email: email ?? this.email,
  gander: gander ?? this.gander,
  phone: phone ?? this.phone,
  adress: adress ?? this.adress,
  date: date ?? this.date,
  userid: userid ?? this.userid,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['age'] = age;
    map['email'] = email;
    map['gander'] = gander;
    map['phone'] = phone;
    map['adress'] = adress;
    map['date'] = date;
    map['userid'] = userid;
    return map;
  }

}