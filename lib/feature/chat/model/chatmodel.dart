import 'dart:convert';
/// p : ""
/// dr : ""
/// status : ""

Chatmodel chatmodelFromJson(String str) => Chatmodel.fromJson(json.decode(str));
String chatmodelToJson(Chatmodel data) => json.encode(data.toJson());
class Chatmodel {
  Chatmodel({
      this.p, 
      this.dr, 
      this.status,});

  Chatmodel.fromJson(dynamic json) {
    p = json['p'];
    dr = json['dr'];
    status = json['status'];
  }
  String? p;
  String? dr;
  String? status;
Chatmodel copyWith({  String? p,
  String? dr,
  String? status,
}) => Chatmodel(  p: p ?? this.p,
  dr: dr ?? this.dr,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['p'] = p;
    map['dr'] = dr;
    map['status'] = status;
    return map;
  }

}