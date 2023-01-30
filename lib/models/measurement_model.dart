// To parse this JSON data, do
//
//     final measurmentModel = measurmentModelFromJson(jsonString);

import 'dart:convert';

MeasurmentModel measurmentModelFromJson(String str) =>
    MeasurmentModel.fromJson(json.decode(str));

String measurmentModelToJson(MeasurmentModel data) =>
    json.encode(data.toJson());

class MeasurmentModel {
  MeasurmentModel({
    this.measurments,
    this.total,
  });

  List<Measurment>? measurments;
  int? total;

  factory MeasurmentModel.fromJson(Map<String, dynamic> json) =>
      MeasurmentModel(
        measurments: List<Measurment>.from(
            json["measurments"].map((x) => Measurment.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "measurments": List<dynamic>.from(measurments!.map((x) => x.toJson())),
        "total": total,
      };
}

class Measurment {
  Measurment({
    this.timestamp,
    this.type,
    this.measurement,
    this.severity,
    this.triggeredThresholds,
    this.origin,
    this.links,
  });

  DateTime? timestamp;
  String? type;
  Measurement? measurement;
  String? severity;
  List<dynamic>? triggeredThresholds;
  Origin? origin;
  Links? links;

  factory Measurment.fromJson(Map<String, dynamic> json) => Measurment(
        timestamp: DateTime.parse(json["timestamp"]),
        type: json["type"],
        measurement: Measurement.fromJson(json["measurement"]),
        severity: json["severity"],
        triggeredThresholds:
            List<dynamic>.from(json["triggeredThresholds"].map((x) => x)),
        origin: Origin.fromJson(json["origin"]),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp!.toIso8601String(),
        "type": type,
        "measurement": measurement!.toJson(),
        "severity": severity,
        "triggeredThresholds":
            List<dynamic>.from(triggeredThresholds!.map((x) => x)),
        "origin": origin!.toJson(),
        "links": links!.toJson(),
      };
}

class Links {
  Links({
    this.measurement,
    this.patient,
  });

  String? measurement;
  String? patient;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        measurement: json["measurement"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "measurement": measurement,
        "patient": patient,
      };
}

class Measurement {
  Measurement({
    this.unit,
    this.value,
  });

  String? unit;
  int? value;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        unit: json["unit"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "value": value,
      };
}

class Origin {
  Origin({
    this.manualMeasurement,
  });

  ManualMeasurement? manualMeasurement;

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        manualMeasurement:
            ManualMeasurement.fromJson(json["manualMeasurement"]),
      );

  Map<String, dynamic> toJson() => {
        "manualMeasurement": manualMeasurement!.toJson(),
      };
}

class ManualMeasurement {
  ManualMeasurement({
    this.enteredBy,
  });

  String? enteredBy;

  factory ManualMeasurement.fromJson(Map<String, dynamic> json) =>
      ManualMeasurement(
        enteredBy: json["enteredBy"],
      );

  Map<String, dynamic> toJson() => {
        "enteredBy": enteredBy,
      };
}
