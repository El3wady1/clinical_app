import 'dart:convert';
/// history : ""

ModelHistory modelHistoryFromJson(String str) => ModelHistory.fromJson(json.decode(str));
String modelHistoryToJson(ModelHistory data) => json.encode(data.toJson());
class ModelHistory {
  ModelHistory({
      this.history,});

  ModelHistory.fromJson(dynamic json) {
    history = json['history'];
  }
  String? history;
ModelHistory copyWith({  String? history,
}) => ModelHistory(  history: history ?? this.history,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['history'] = history;
    return map;
  }

}