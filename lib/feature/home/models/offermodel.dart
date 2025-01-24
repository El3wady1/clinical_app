import 'dart:convert';
/// offernow : "الخميس"

Offermodel offermodelFromJson(String str) => Offermodel.fromJson(json.decode(str));
String offermodelToJson(Offermodel data) => json.encode(data.toJson());
class Offermodel {
  Offermodel({
      this.offernow,});

  Offermodel.fromJson(dynamic json) {
    offernow = json['offernows'];
  }
  String? offernow;
Offermodel copyWith({  String? offernow,
}) => Offermodel(  offernow: offernow ?? this.offernow,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offerid'] = offernow;
    return map;
  }

}