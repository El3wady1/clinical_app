import 'dart:convert';
/// statusbook : ""
/// date : ""
/// time : ""

Statusbookss statusbookssFromJson(String str) => Statusbookss.fromJson(json.decode(str));
String statusbookssToJson(Statusbookss data) => json.encode(data.toJson());
class Statusbookss {
  Statusbookss({
      this.statusbook, 
      this.date, 
      this.time,});

  Statusbookss.fromJson(dynamic json) {
    statusbook = json['statusbook'];
    date = json['date'];
    time = json['time'];
  }
  String? statusbook;
  String? date;
  String? time;
Statusbookss copyWith({  String? statusbook,
  String? date,
  String? time,
}) => Statusbookss(  statusbook: statusbook ?? this.statusbook,
  date: date ?? this.date,
  time: time ?? this.time,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusbook'] = statusbook;
    map['date'] = date;
    map['time'] = time;
    return map;
  }

}