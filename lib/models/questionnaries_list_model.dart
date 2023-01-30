// To parse this JSON data, do
//
//     final questionnariesListModel = questionnariesListModelFromJson(jsonString);

import 'dart:convert';

QuestionnariesListModel questionnariesListModelFromJson(String str) =>
    QuestionnariesListModel.fromJson(json.decode(str));

String questionnariesListModelToJson(QuestionnariesListModel data) =>
    json.encode(data.toJson());

class QuestionnariesListModel {
  QuestionnariesListModel({
    this.status,
    this.questionnaires,
  });

  String? status;
  List<Questionnaire>? questionnaires;

  factory QuestionnariesListModel.fromJson(Map<String, dynamic> json) =>
      QuestionnariesListModel(
        status: json["status"],
        questionnaires: List<Questionnaire>.from(
            json["questionnaires"].map((x) => Questionnaire.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "questionnaires":
            List<dynamic>.from(questionnaires!.map((x) => x.toJson())),
      };
}

class Questionnaire {
  Questionnaire({
    this.name,
    this.version,
    this.links,
  });

  String? name;
  String? version;
  Links? links;

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        name: json["name"],
        version: json["version"],
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "links": links!.toJson(),
      };
}

class Links {
  Links({
    this.questionnaire,
  });

  String? questionnaire;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        questionnaire: json["questionnaire"],
      );

  Map<String, dynamic> toJson() => {
        "questionnaire": questionnaire,
      };
}
