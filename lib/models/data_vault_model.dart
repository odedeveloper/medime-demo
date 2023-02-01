// To parse this JSON data, do
//
//     final dataVaultModel = dataVaultModelFromJson(jsonString);

import 'dart:convert';

DataVaultModel dataVaultModelFromJson(String str) =>
    DataVaultModel.fromJson(json.decode(str));

String dataVaultModelToJson(DataVaultModel data) => json.encode(data.toJson());

class DataVaultModel {
  DataVaultModel({
    required this.links,
    required this.healthCareId,
    required this.lastName,
    required this.sex,
    required this.address,
    required this.email,
    required this.firstName,
    required this.patientGroups,
    required this.profileImage,
    required this.city,
    required this.emailVerified,
    required this.clinician,
    required this.dob,
    required this.odenId,
    required this.username,
    required this.postalCode,
    required this.measurements,
    required this.questionnaires,
  });

  final DataVaultModelLinks links;
  final String healthCareId;
  final String lastName;
  final String sex;
  final String address;
  final String email;
  final String firstName;
  final List<PatientGroup> patientGroups;
  final String profileImage;
  final String city;
  final String emailVerified;
  final String clinician;
  final String dob;
  final String odenId;
  final String username;
  final String postalCode;
  final Measurements measurements;
  final Questionnaires questionnaires;

  factory DataVaultModel.fromJson(Map<String, dynamic> json) => DataVaultModel(
        links: DataVaultModelLinks.fromJson(json["links"]),
        healthCareId: json["healthCareID"],
        lastName: json["lastName"],
        sex: json["sex"],
        address: json["address"],
        email: json["email"],
        firstName: json["firstName"],
        patientGroups: List<PatientGroup>.from(
            json["patientGroups"].map((x) => PatientGroup.fromJson(x))),
        profileImage: json["profileImage"],
        city: json["city"],
        emailVerified: json["emailVerified"],
        clinician: json["clinician"],
        dob: json["dob"],
        odenId: json["odenId"],
        username: json["username"],
        postalCode: json["postalCode"],
        measurements: Measurements.fromJson(json["measurements"]),
        questionnaires: Questionnaires.fromJson(json["questionnaires"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "healthCareID": healthCareId,
        "lastName": lastName,
        "sex": sex,
        "address": address,
        "email": email,
        "firstName": firstName,
        "patientGroups":
            List<dynamic>.from(patientGroups.map((x) => x.toJson())),
        "profileImage": profileImage,
        "city": city,
        "emailVerified": emailVerified,
        "clinician": clinician,
        "dob": dob,
        "odenId": odenId,
        "username": username,
        "postalCode": postalCode,
        "measurements": measurements.toJson(),
        "questionnaires": questionnaires.toJson(),
      };
}

class DataVaultModelLinks {
  DataVaultModelLinks({
    required this.calendar,
    required this.metadata,
    required this.attachments,
    required this.contactInfo,
    required this.questionnaireSchedules,
    required this.threads,
    required this.acknowledgements,
    required this.individualSessions,
    required this.changePassword,
    required this.questionnaires,
    required this.patientNotes,
    required this.thresholds,
    this.dataResponsible,
    required this.self,
    required this.messages,
    required this.questionnaireResults,
    required this.notifications,
    required this.measurements,
  });

  final String calendar;
  final String metadata;
  final String attachments;
  final String contactInfo;
  final String questionnaireSchedules;
  final String threads;
  final String acknowledgements;
  final String individualSessions;
  final String changePassword;
  final String questionnaires;
  final String patientNotes;
  final String thresholds;
  final dynamic dataResponsible;
  final String self;
  final String messages;
  final String questionnaireResults;
  final String notifications;
  final String measurements;

  factory DataVaultModelLinks.fromJson(Map<String, dynamic> json) =>
      DataVaultModelLinks(
        calendar: json["calendar"],
        metadata: json["metadata"],
        attachments: json["attachments"],
        contactInfo: json["contactInfo"],
        questionnaireSchedules: json["questionnaireSchedules"],
        threads: json["threads"],
        acknowledgements: json["acknowledgements"],
        individualSessions: json["individualSessions"],
        changePassword: json["changePassword"],
        questionnaires: json["questionnaires"],
        patientNotes: json["patientNotes"],
        thresholds: json["thresholds"],
        dataResponsible: json["dataResponsible"],
        self: json["self"],
        messages: json["messages"],
        questionnaireResults: json["questionnaireResults"],
        notifications: json["notifications"],
        measurements: json["measurements"],
      );

  Map<String, dynamic> toJson() => {
        "calendar": calendar,
        "metadata": metadata,
        "attachments": attachments,
        "contactInfo": contactInfo,
        "questionnaireSchedules": questionnaireSchedules,
        "threads": threads,
        "acknowledgements": acknowledgements,
        "individualSessions": individualSessions,
        "changePassword": changePassword,
        "questionnaires": questionnaires,
        "patientNotes": patientNotes,
        "thresholds": thresholds,
        "dataResponsible": dataResponsible,
        "self": self,
        "messages": messages,
        "questionnaireResults": questionnaireResults,
        "notifications": notifications,
        "measurements": measurements,
      };
}

class Measurements {
  Measurements({
    required this.measurments,
    required this.total,
  });

  final List<Measurment> measurments;
  final double total;

  factory Measurements.fromJson(Map<String, dynamic> json) => Measurements(
        measurments: List<Measurment>.from(
            json["measurments"].map((x) => Measurment.fromJson(x))),
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "measurments": List<dynamic>.from(measurments.map((x) => x.toJson())),
        "total": total,
      };
}

class Measurment {
  Measurment({
    required this.timestamp,
    required this.type,
    required this.measurement,
    required this.severity,
    required this.triggeredThresholds,
    required this.origin,
    required this.links,
  });

  final DateTime timestamp;
  final String type;
  final Measurement measurement;
  final String severity;
  final List<dynamic> triggeredThresholds;
  final Origin origin;
  final MeasurmentLinks links;

  factory Measurment.fromJson(Map<String, dynamic> json) => Measurment(
        timestamp: DateTime.parse(json["timestamp"]),
        type: json["type"],
        measurement: Measurement.fromJson(json["measurement"]),
        severity: json["severity"],
        triggeredThresholds:
            List<dynamic>.from(json["triggeredThresholds"].map((x) => x)),
        origin: Origin.fromJson(json["origin"]),
        links: MeasurmentLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "type": type,
        "measurement": measurement.toJson(),
        "severity": severity,
        "triggeredThresholds":
            List<dynamic>.from(triggeredThresholds.map((x) => x)),
        "origin": origin.toJson(),
        "links": links.toJson(),
      };
}

class MeasurmentLinks {
  MeasurmentLinks({
    required this.measurement,
    required this.patient,
  });

  final String measurement;
  final String patient;

  factory MeasurmentLinks.fromJson(Map<String, dynamic> json) =>
      MeasurmentLinks(
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
    required this.unit,
    required this.systolic,
    required this.diastolic,
  });

  final String unit;
  final double systolic;
  final double diastolic;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        unit: json["unit"],
        systolic: json["systolic"].toDouble(),
        diastolic: json["diastolic"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "unit": unit,
        "systolic": systolic,
        "diastolic": diastolic,
      };
}

class Origin {
  Origin({
    required this.manualMeasurement,
  });

  final ManualMeasurement manualMeasurement;

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        manualMeasurement:
            ManualMeasurement.fromJson(json["manualMeasurement"]),
      );

  Map<String, dynamic> toJson() => {
        "manualMeasurement": manualMeasurement.toJson(),
      };
}

class ManualMeasurement {
  ManualMeasurement({
    required this.enteredBy,
  });

  final String enteredBy;

  factory ManualMeasurement.fromJson(Map<String, dynamic> json) =>
      ManualMeasurement(
        enteredBy: json["enteredBy"],
      );

  Map<String, dynamic> toJson() => {
        "enteredBy": enteredBy,
      };
}

class PatientGroup {
  PatientGroup({
    required this.name,
    required this.links,
  });

  final String name;
  final PatientGroupLinks links;

  factory PatientGroup.fromJson(Map<String, dynamic> json) => PatientGroup(
        name: json["name"],
        links: PatientGroupLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "links": links.toJson(),
      };
}

class PatientGroupLinks {
  PatientGroupLinks({
    required this.organization,
    required this.patientGroup,
  });

  final String organization;
  final String patientGroup;

  factory PatientGroupLinks.fromJson(Map<String, dynamic> json) =>
      PatientGroupLinks(
        organization: json["organization"],
        patientGroup: json["patientGroup"],
      );

  Map<String, dynamic> toJson() => {
        "organization": organization,
        "patientGroup": patientGroup,
      };
}

class Questionnaires {
  Questionnaires({
    required this.questionnaire12Json,
    required this.questionnaire3Json,
    required this.questionnaire4Json,
    required this.questionnaire5Json,
    required this.questionnaire8Json,
    required this.questionnaire9Json,
    required this.questionnairesListJson,
  });

  final Questionnaire12Json questionnaire12Json;
  final QuestionnaireJson questionnaire3Json;
  final QuestionnaireJson questionnaire4Json;
  final QuestionnaireJson questionnaire5Json;
  final Questionnaire8Json questionnaire8Json;
  final Questionnaire9Json questionnaire9Json;
  final QuestionnairesListJson questionnairesListJson;

  factory Questionnaires.fromJson(Map<String, dynamic> json) => Questionnaires(
        questionnaire12Json:
            Questionnaire12Json.fromJson(json["questionnaire-12.json"]),
        questionnaire3Json:
            QuestionnaireJson.fromJson(json["questionnaire-3.json"]),
        questionnaire4Json:
            QuestionnaireJson.fromJson(json["questionnaire-4.json"]),
        questionnaire5Json:
            QuestionnaireJson.fromJson(json["questionnaire-5.json"]),
        questionnaire8Json:
            Questionnaire8Json.fromJson(json["questionnaire-8.json"]),
        questionnaire9Json:
            Questionnaire9Json.fromJson(json["questionnaire-9.json"]),
        questionnairesListJson:
            QuestionnairesListJson.fromJson(json["questionnaires-list.json"]),
      );

  Map<String, dynamic> toJson() => {
        "questionnaire-12.json": questionnaire12Json.toJson(),
        "questionnaire-3.json": questionnaire3Json.toJson(),
        "questionnaire-4.json": questionnaire4Json.toJson(),
        "questionnaire-5.json": questionnaire5Json.toJson(),
        "questionnaire-8.json": questionnaire8Json.toJson(),
        "questionnaire-9.json": questionnaire9Json.toJson(),
        "questionnaires-list.json": questionnairesListJson.toJson(),
      };
}

class Questionnaire12Json {
  Questionnaire12Json({
    required this.name,
    required this.version,
    required this.startNode,
    required this.endNode,
    required this.nodes,
    required this.output,
    required this.links,
  });

  final String name;
  final String version;
  final String startNode;
  final String endNode;
  final List<Questionnaire12JsonNode> nodes;
  final List<Output> output;
  final Questionnaire12JsonLinks links;

  factory Questionnaire12Json.fromJson(Map<String, dynamic> json) =>
      Questionnaire12Json(
        name: json["name"],
        version: json["version"],
        startNode: json["startNode"],
        endNode: json["endNode"],
        nodes: List<Questionnaire12JsonNode>.from(
            json["nodes"].map((x) => Questionnaire12JsonNode.fromJson(x))),
        output:
            List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
        links: Questionnaire12JsonLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "startNode": startNode,
        "endNode": endNode,
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
        "output": List<dynamic>.from(output.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class Questionnaire12JsonLinks {
  Questionnaire12JsonLinks({
    required this.self,
    required this.questionnaireResult,
    required this.patient,
  });

  final String self;
  final String questionnaireResult;
  final String patient;

  factory Questionnaire12JsonLinks.fromJson(Map<String, dynamic> json) =>
      Questionnaire12JsonLinks(
        self: json["self"],
        questionnaireResult: json["questionnaireResult"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "questionnaireResult": questionnaireResult,
        "patient": patient,
      };
}

class Questionnaire12JsonNode {
  Questionnaire12JsonNode({
    this.ioNode,
    this.assignmentNode,
    this.endNode,
  });

  final IoNode? ioNode;
  final PurpleAssignmentNode? assignmentNode;
  final EndNode? endNode;

  factory Questionnaire12JsonNode.fromJson(Map<String, dynamic> json) =>
      Questionnaire12JsonNode(
        ioNode: json["IONode"] == null ? null : IoNode.fromJson(json["IONode"]),
        assignmentNode: json["AssignmentNode"] == null
            ? null
            : PurpleAssignmentNode.fromJson(json["AssignmentNode"]),
        endNode:
            json["EndNode"] == null ? null : EndNode.fromJson(json["EndNode"]),
      );

  Map<String, dynamic> toJson() => {
        "IONode": ioNode?.toJson(),
        "AssignmentNode": assignmentNode?.toJson(),
        "EndNode": endNode?.toJson(),
      };
}

class PurpleAssignmentNode {
  PurpleAssignmentNode({
    required this.nodeName,
    required this.next,
    required this.variable,
    required this.expression,
  });

  final String nodeName;
  final String next;
  final Output variable;
  final PurpleExpression expression;

  factory PurpleAssignmentNode.fromJson(Map<String, dynamic> json) =>
      PurpleAssignmentNode(
        nodeName: json["nodeName"],
        next: json["next"],
        variable: Output.fromJson(json["variable"]),
        expression: PurpleExpression.fromJson(json["expression"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "variable": variable.toJson(),
        "expression": expression.toJson(),
      };
}

class PurpleExpression {
  PurpleExpression({
    required this.type,
    required this.value,
  });

  final Type type;
  final bool value;

  factory PurpleExpression.fromJson(Map<String, dynamic> json) =>
      PurpleExpression(
        type: typeValues.map[json["type"]]!,
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "value": value,
      };
}

enum Type {
  BOOLEAN,
  STRING,
  FLOAT,
  INTEGER,
  OBJECT,
  TYPE_INTEGER,
  TYPE_FLOAT,
  TYPE_STRING,
  TYPE_OBJECT
}

final typeValues = EnumValues({
  "Boolean": Type.BOOLEAN,
  "Float": Type.FLOAT,
  "Integer": Type.INTEGER,
  "Object": Type.OBJECT,
  "String": Type.STRING,
  "Float[]": Type.TYPE_FLOAT,
  "Integer[]": Type.TYPE_INTEGER,
  "Object[]": Type.TYPE_OBJECT,
  "String[]": Type.TYPE_STRING
});

class Output {
  Output({
    required this.name,
    required this.type,
  });

  final String name;
  final Type type;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
        name: json["name"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
      };
}

class EndNode {
  EndNode({
    required this.nodeName,
  });

  final String nodeName;

  factory EndNode.fromJson(Map<String, dynamic> json) => EndNode(
        nodeName: json["nodeName"],
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
      };
}

class IoNode {
  IoNode({
    required this.nodeName,
    required this.elements,
  });

  final String nodeName;
  final List<Element> elements;

  factory IoNode.fromJson(Map<String, dynamic> json) => IoNode(
        nodeName: json["nodeName"],
        elements: List<Element>.from(
            json["elements"].map((x) => Element.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
      };
}

class Element {
  Element({
    this.textViewElement,
    this.twoButtonElement,
  });

  final TextViewElement? textViewElement;
  final TwoButtonElement? twoButtonElement;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        textViewElement: json["TextViewElement"] == null
            ? null
            : TextViewElement.fromJson(json["TextViewElement"]),
        twoButtonElement: json["TwoButtonElement"] == null
            ? null
            : TwoButtonElement.fromJson(json["TwoButtonElement"]),
      );

  Map<String, dynamic> toJson() => {
        "TextViewElement": textViewElement?.toJson(),
        "TwoButtonElement": twoButtonElement?.toJson(),
      };
}

class TextViewElement {
  TextViewElement({
    required this.text,
  });

  final String text;

  factory TextViewElement.fromJson(Map<String, dynamic> json) =>
      TextViewElement(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class TwoButtonElement {
  TwoButtonElement({
    required this.leftText,
    required this.leftNext,
    required this.rightText,
    required this.rightNext,
  });

  final String leftText;
  final String leftNext;
  final String rightText;
  final String rightNext;

  factory TwoButtonElement.fromJson(Map<String, dynamic> json) =>
      TwoButtonElement(
        leftText: json["leftText"],
        leftNext: json["leftNext"],
        rightText: json["rightText"],
        rightNext: json["rightNext"],
      );

  Map<String, dynamic> toJson() => {
        "leftText": leftText,
        "leftNext": leftNext,
        "rightText": rightText,
        "rightNext": rightNext,
      };
}

class QuestionnaireJson {
  QuestionnaireJson({
    required this.name,
    required this.version,
    required this.startNode,
    required this.endNode,
    required this.nodes,
    required this.output,
    required this.links,
  });

  final String name;
  final String version;
  final String startNode;
  final String endNode;
  final List<Questionnaire3JsonNode> nodes;
  final List<Output> output;
  final Questionnaire12JsonLinks links;

  factory QuestionnaireJson.fromJson(Map<String, dynamic> json) =>
      QuestionnaireJson(
        name: json["name"],
        version: json["version"],
        startNode: json["startNode"],
        endNode: json["endNode"],
        nodes: List<Questionnaire3JsonNode>.from(
            json["nodes"].map((x) => Questionnaire3JsonNode.fromJson(x))),
        output:
            List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
        links: Questionnaire12JsonLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "startNode": startNode,
        "endNode": endNode,
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
        "output": List<dynamic>.from(output.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class Questionnaire3JsonNode {
  Questionnaire3JsonNode({
    this.endNode,
    this.spirometerDeviceNode,
    this.assignmentNode,
    this.ioNode,
    this.saturationDeviceNode,
    this.weightDeviceNode,
  });

  final EndNode? endNode;
  final SpirometerDeviceNode? spirometerDeviceNode;
  final FluffyAssignmentNode? assignmentNode;
  final IoNode? ioNode;
  final SaturationDeviceNode? saturationDeviceNode;
  final DeviceNode? weightDeviceNode;

  factory Questionnaire3JsonNode.fromJson(Map<String, dynamic> json) =>
      Questionnaire3JsonNode(
        endNode:
            json["EndNode"] == null ? null : EndNode.fromJson(json["EndNode"]),
        spirometerDeviceNode: json["SpirometerDeviceNode"] == null
            ? null
            : SpirometerDeviceNode.fromJson(json["SpirometerDeviceNode"]),
        assignmentNode: json["AssignmentNode"] == null
            ? null
            : FluffyAssignmentNode.fromJson(json["AssignmentNode"]),
        ioNode: json["IONode"] == null ? null : IoNode.fromJson(json["IONode"]),
        saturationDeviceNode: json["SaturationDeviceNode"] == null
            ? null
            : SaturationDeviceNode.fromJson(json["SaturationDeviceNode"]),
        weightDeviceNode: json["WeightDeviceNode"] == null
            ? null
            : DeviceNode.fromJson(json["WeightDeviceNode"]),
      );

  Map<String, dynamic> toJson() => {
        "EndNode": endNode?.toJson(),
        "SpirometerDeviceNode": spirometerDeviceNode?.toJson(),
        "AssignmentNode": assignmentNode?.toJson(),
        "IONode": ioNode?.toJson(),
        "SaturationDeviceNode": saturationDeviceNode?.toJson(),
        "WeightDeviceNode": weightDeviceNode?.toJson(),
      };
}

class FluffyAssignmentNode {
  FluffyAssignmentNode({
    required this.nodeName,
    required this.next,
    required this.variable,
    required this.expression,
  });

  final String nodeName;
  final String next;
  final Output variable;
  final FluffyExpression expression;

  factory FluffyAssignmentNode.fromJson(Map<String, dynamic> json) =>
      FluffyAssignmentNode(
        nodeName: json["nodeName"],
        next: json["next"],
        variable: Output.fromJson(json["variable"]),
        expression: FluffyExpression.fromJson(json["expression"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "variable": variable.toJson(),
        "expression": expression.toJson(),
      };
}

class FluffyExpression {
  FluffyExpression({
    required this.type,
    required this.value,
  });

  final Type type;
  final dynamic value;

  factory FluffyExpression.fromJson(Map<String, dynamic> json) =>
      FluffyExpression(
        type: typeValues.map[json["type"]]!,
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "value": value,
      };
}

enum ValueEnum { GREEN, YELLOW }

final valueEnumValues =
    EnumValues({"GREEN": ValueEnum.GREEN, "YELLOW": ValueEnum.YELLOW});

class SaturationDeviceNode {
  SaturationDeviceNode({
    required this.nodeName,
    required this.next,
    required this.nextFail,
    required this.text,
    required this.origin,
    required this.saturation,
    required this.pulse,
  });

  final String nodeName;
  final String next;
  final String nextFail;
  final String text;
  final Output origin;
  final Output saturation;
  final Output pulse;

  factory SaturationDeviceNode.fromJson(Map<String, dynamic> json) =>
      SaturationDeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        saturation: Output.fromJson(json["saturation"]),
        pulse: Output.fromJson(json["pulse"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin.toJson(),
        "saturation": saturation.toJson(),
        "pulse": pulse.toJson(),
      };
}

class SpirometerDeviceNode {
  SpirometerDeviceNode({
    required this.nodeName,
    required this.next,
    required this.nextFail,
    required this.text,
    required this.origin,
    required this.fev1,
    required this.fev6,
    required this.fev1Fev6Ratio,
    required this.fef2575,
  });

  final String nodeName;
  final String next;
  final String nextFail;
  final String text;
  final Output origin;
  final Output fev1;
  final Output fev6;
  final Output fev1Fev6Ratio;
  final Output fef2575;

  factory SpirometerDeviceNode.fromJson(Map<String, dynamic> json) =>
      SpirometerDeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        fev1: Output.fromJson(json["fev1"]),
        fev6: Output.fromJson(json["fev6"]),
        fev1Fev6Ratio: Output.fromJson(json["fev1Fev6Ratio"]),
        fef2575: Output.fromJson(json["fef2575"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin.toJson(),
        "fev1": fev1.toJson(),
        "fev6": fev6.toJson(),
        "fev1Fev6Ratio": fev1Fev6Ratio.toJson(),
        "fef2575": fef2575.toJson(),
      };
}

class DeviceNode {
  DeviceNode({
    required this.nodeName,
    required this.next,
    required this.nextFail,
    required this.text,
    required this.origin,
    this.weight,
    this.bloodSugarMeasurements,
  });

  final String nodeName;
  final String next;
  final String nextFail;
  final String text;
  final Output origin;
  final Weight? weight;
  final Output? bloodSugarMeasurements;

  factory DeviceNode.fromJson(Map<String, dynamic> json) => DeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        weight: json["weight"] == null ? null : Weight.fromJson(json["weight"]),
        bloodSugarMeasurements: json["bloodSugarMeasurements"] == null
            ? null
            : Output.fromJson(json["bloodSugarMeasurements"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin.toJson(),
        "weight": weight?.toJson(),
        "bloodSugarMeasurements": bloodSugarMeasurements?.toJson(),
      };
}

class Weight {
  Weight({
    required this.name,
    required this.type,
    required this.range,
  });

  final String name;
  final Type type;
  final Range range;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        range: Range.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
        "range": range.toJson(),
      };
}

class Range {
  Range({
    required this.max,
    required this.min,
  });

  final double max;
  final double min;

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        max: json["max"].toDouble(),
        min: json["min"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}

class Questionnaire8Json {
  Questionnaire8Json({
    required this.name,
    required this.version,
    required this.startNode,
    required this.endNode,
    required this.nodes,
    required this.output,
    required this.links,
  });

  final String name;
  final String version;
  final String startNode;
  final String endNode;
  final List<Questionnaire8JsonNode> nodes;
  final List<Output> output;
  final Questionnaire12JsonLinks links;

  factory Questionnaire8Json.fromJson(Map<String, dynamic> json) =>
      Questionnaire8Json(
        name: json["name"],
        version: json["version"],
        startNode: json["startNode"],
        endNode: json["endNode"],
        nodes: List<Questionnaire8JsonNode>.from(
            json["nodes"].map((x) => Questionnaire8JsonNode.fromJson(x))),
        output:
            List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
        links: Questionnaire12JsonLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "startNode": startNode,
        "endNode": endNode,
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
        "output": List<dynamic>.from(output.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class Questionnaire8JsonNode {
  Questionnaire8JsonNode({
    this.endNode,
    this.ctgDeviceNode,
    this.assignmentNode,
  });

  final EndNode? endNode;
  final CtgDeviceNode? ctgDeviceNode;
  final FluffyAssignmentNode? assignmentNode;

  factory Questionnaire8JsonNode.fromJson(Map<String, dynamic> json) =>
      Questionnaire8JsonNode(
        endNode:
            json["EndNode"] == null ? null : EndNode.fromJson(json["EndNode"]),
        ctgDeviceNode: json["CtgDeviceNode"] == null
            ? null
            : CtgDeviceNode.fromJson(json["CtgDeviceNode"]),
        assignmentNode: json["AssignmentNode"] == null
            ? null
            : FluffyAssignmentNode.fromJson(json["AssignmentNode"]),
      );

  Map<String, dynamic> toJson() => {
        "EndNode": endNode?.toJson(),
        "CtgDeviceNode": ctgDeviceNode?.toJson(),
        "AssignmentNode": assignmentNode?.toJson(),
      };
}

class CtgDeviceNode {
  CtgDeviceNode({
    required this.nodeName,
    required this.next,
    required this.nextFail,
    required this.text,
    required this.origin,
    required this.fhr,
    required this.mhr,
    required this.qfhr,
    required this.toco,
    required this.signal,
    required this.signalToNoise,
    required this.fetalHeight,
    required this.voltageStart,
    required this.voltageEnd,
    required this.startTime,
    required this.endTime,
    required this.uaDelay,
  });

  final String nodeName;
  final String next;
  final String nextFail;
  final String text;
  final Output origin;
  final Output fhr;
  final Output mhr;
  final Output qfhr;
  final Output toco;
  final Output signal;
  final Output signalToNoise;
  final Output fetalHeight;
  final Output voltageStart;
  final Output voltageEnd;
  final Output startTime;
  final Output endTime;
  final Output uaDelay;

  factory CtgDeviceNode.fromJson(Map<String, dynamic> json) => CtgDeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        fhr: Output.fromJson(json["fhr"]),
        mhr: Output.fromJson(json["mhr"]),
        qfhr: Output.fromJson(json["qfhr"]),
        toco: Output.fromJson(json["toco"]),
        signal: Output.fromJson(json["signal"]),
        signalToNoise: Output.fromJson(json["signalToNoise"]),
        fetalHeight: Output.fromJson(json["fetalHeight"]),
        voltageStart: Output.fromJson(json["voltageStart"]),
        voltageEnd: Output.fromJson(json["voltageEnd"]),
        startTime: Output.fromJson(json["startTime"]),
        endTime: Output.fromJson(json["endTime"]),
        uaDelay: Output.fromJson(json["uaDelay"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin.toJson(),
        "fhr": fhr.toJson(),
        "mhr": mhr.toJson(),
        "qfhr": qfhr.toJson(),
        "toco": toco.toJson(),
        "signal": signal.toJson(),
        "signalToNoise": signalToNoise.toJson(),
        "fetalHeight": fetalHeight.toJson(),
        "voltageStart": voltageStart.toJson(),
        "voltageEnd": voltageEnd.toJson(),
        "startTime": startTime.toJson(),
        "endTime": endTime.toJson(),
        "uaDelay": uaDelay.toJson(),
      };
}

class Questionnaire9Json {
  Questionnaire9Json({
    required this.name,
    required this.version,
    required this.startNode,
    required this.endNode,
    required this.nodes,
    required this.output,
    required this.links,
  });

  final String name;
  final String version;
  final String startNode;
  final String endNode;
  final List<Questionnaire9JsonNode> nodes;
  final List<Output> output;
  final Questionnaire12JsonLinks links;

  factory Questionnaire9Json.fromJson(Map<String, dynamic> json) =>
      Questionnaire9Json(
        name: json["name"],
        version: json["version"],
        startNode: json["startNode"],
        endNode: json["endNode"],
        nodes: List<Questionnaire9JsonNode>.from(
            json["nodes"].map((x) => Questionnaire9JsonNode.fromJson(x))),
        output:
            List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
        links: Questionnaire12JsonLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "startNode": startNode,
        "endNode": endNode,
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
        "output": List<dynamic>.from(output.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class Questionnaire9JsonNode {
  Questionnaire9JsonNode({
    this.bloodSugarDeviceNode,
    this.assignmentNode,
    this.endNode,
  });

  final DeviceNode? bloodSugarDeviceNode;
  final FluffyAssignmentNode? assignmentNode;
  final EndNode? endNode;

  factory Questionnaire9JsonNode.fromJson(Map<String, dynamic> json) =>
      Questionnaire9JsonNode(
        bloodSugarDeviceNode: json["BloodSugarDeviceNode"] == null
            ? null
            : DeviceNode.fromJson(json["BloodSugarDeviceNode"]),
        assignmentNode: json["AssignmentNode"] == null
            ? null
            : FluffyAssignmentNode.fromJson(json["AssignmentNode"]),
        endNode:
            json["EndNode"] == null ? null : EndNode.fromJson(json["EndNode"]),
      );

  Map<String, dynamic> toJson() => {
        "BloodSugarDeviceNode": bloodSugarDeviceNode?.toJson(),
        "AssignmentNode": assignmentNode?.toJson(),
        "EndNode": endNode?.toJson(),
      };
}

class QuestionnairesListJson {
  QuestionnairesListJson({
    required this.results,
    required this.links,
  });

  final List<Result> results;
  final QuestionnairesListJsonLinks links;

  factory QuestionnairesListJson.fromJson(Map<String, dynamic> json) =>
      QuestionnairesListJson(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        links: QuestionnairesListJsonLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "links": links.toJson(),
      };
}

class QuestionnairesListJsonLinks {
  QuestionnairesListJsonLinks({
    required this.self,
    required this.patient,
  });

  final String self;
  final String patient;

  factory QuestionnairesListJsonLinks.fromJson(Map<String, dynamic> json) =>
      QuestionnairesListJsonLinks(
        self: json["self"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "patient": patient,
      };
}

class Result {
  Result({
    required this.name,
    required this.version,
    required this.links,
  });

  final String name;
  final String version;
  final ResultLinks links;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        version: json["version"],
        links: ResultLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "links": links.toJson(),
      };
}

class ResultLinks {
  ResultLinks({
    required this.questionnaire,
  });

  final String questionnaire;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        questionnaire: json["questionnaire"],
      );

  Map<String, dynamic> toJson() => {
        "questionnaire": questionnaire,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
