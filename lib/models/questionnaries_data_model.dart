// To parse this JSON data, do
//
//     final questionnariesListModel = questionnariesListModelFromJson(jsonString);

import 'dart:convert';

QuestionnariesDataListModel questionnariesDataListModelFromJson(String str) =>
    QuestionnariesDataListModel.fromJson(json.decode(str));

String questionnariesDataListModelToJson(QuestionnariesDataListModel data) =>
    json.encode(data.toJson());

class QuestionnariesDataListModel {
  QuestionnariesDataListModel({
    this.status,
    this.response,
  });

  String? status;
  Response? response;

  factory QuestionnariesDataListModel.fromJson(Map<String, dynamic> json) =>
      QuestionnariesDataListModel(
        status: json["status"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response!.toJson(),
      };
}

class Response {
  Response({
    this.name,
    this.version,
    this.startNode,
    this.endNode,
    this.nodes,
    this.output,
    this.links,
  });

  String? name;
  String? version;
  String? startNode;
  String? endNode;
  List<Node>? nodes;
  List<Output>? output;
  Links? links;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: json["name"],
        version: json["version"],
        startNode: json["startNode"],
        endNode: json["endNode"],
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
        output:
            List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "startNode": startNode,
        "endNode": endNode,
        "nodes": List<dynamic>.from(nodes!.map((x) => x.toJson())),
        "output": List<dynamic>.from(output!.map((x) => x.toJson())),
        "links": links!.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.questionnaireResult,
    this.patient,
  });

  String? self;
  String? questionnaireResult;
  String? patient;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
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

class Node {
  Node({
    this.bloodSugarDeviceNode,
    this.weightDeviceNode,
    this.saturationDeviceNode,
    this.ctgDeviceNode,
    this.assignmentNode,
    this.endNode,
    this.ioNode,
  });

  BloodSugarDeviceNode? bloodSugarDeviceNode;
  WeightDeviceNode? weightDeviceNode;
  SaturationDeviceNode? saturationDeviceNode;
  CtgDeviceNode? ctgDeviceNode;
  AssignmentNode? assignmentNode;
  EndNode? endNode;
  IoNode? ioNode;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        weightDeviceNode: json["WeightDeviceNode"] == null
            ? null
            : WeightDeviceNode.fromJson(json["WeightDeviceNode"]),
        bloodSugarDeviceNode: json["BloodSugarDeviceNode"] == null
            ? null
            : BloodSugarDeviceNode.fromJson(json["BloodSugarDeviceNode"]),
        saturationDeviceNode: json["SaturationDeviceNode"] == null
            ? null
            : SaturationDeviceNode.fromJson(json["SaturationDeviceNode"]),
        ctgDeviceNode: json["CtgDeviceNode"] == null
            ? null
            : CtgDeviceNode.fromJson(json["CtgDeviceNode"]),
        assignmentNode: json["AssignmentNode"] == null
            ? null
            : AssignmentNode.fromJson(json["AssignmentNode"]),
        endNode:
            json["EndNode"] == null ? null : EndNode.fromJson(json["EndNode"]),
        ioNode: json["IONode"] == null ? null : IoNode.fromJson(json["IONode"]),
      );

  Map<String, dynamic> toJson() => {
        "WeightDeviceNode":
            weightDeviceNode == null ? null : weightDeviceNode!.toJson(),
        "BloodSugarDeviceNode": bloodSugarDeviceNode == null
            ? null
            : bloodSugarDeviceNode!.toJson(),
        "SaturationDeviceNode": saturationDeviceNode == null
            ? null
            : saturationDeviceNode!.toJson(),
        "CtgDeviceNode": ctgDeviceNode == null ? null : ctgDeviceNode!.toJson(),
        "AssignmentNode":
            assignmentNode == null ? null : assignmentNode!.toJson(),
        "EndNode": endNode == null ? null : endNode!.toJson(),
        "IONode": ioNode == null ? null : ioNode!.toJson(),
      };
}

class AssignmentNode {
  AssignmentNode({
    this.nodeName,
    this.next,
    this.variable,
    this.expression,
  });

  String? nodeName;
  String? next;
  Output? variable;
  Expression? expression;

  factory AssignmentNode.fromJson(Map<String, dynamic> json) => AssignmentNode(
        nodeName: json["nodeName"],
        next: json["next"],
        variable: Output.fromJson(json["variable"]),
        expression: Expression.fromJson(json["expression"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "variable": variable!.toJson(),
        "expression": expression!.toJson(),
      };
}

class BloodSugarDeviceNode {
  BloodSugarDeviceNode({
    this.nodeName,
    this.next,
    this.nextFail,
    this.text,
    this.origin,
    this.bloodSugarMeasurements,
  });

  String? nodeName;
  String? next;
  String? nextFail;
  String? text;
  Output? origin;
  Output? bloodSugarMeasurements;

  factory BloodSugarDeviceNode.fromJson(Map<String, dynamic> json) =>
      BloodSugarDeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        bloodSugarMeasurements: Output.fromJson(json["bloodSugarMeasurements"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin!.toJson(),
        "bloodSugarMeasurements": bloodSugarMeasurements!.toJson(),
      };
}

class WeightDeviceNode {
  WeightDeviceNode({
    this.nodeName,
    this.next,
    this.nextFail,
    this.text,
    this.origin,
    this.weight,
  });

  String? nodeName;
  String? next;
  String? nextFail;
  String? text;
  Output? origin;
  Weight? weight;

  factory WeightDeviceNode.fromJson(Map<String, dynamic> json) =>
      WeightDeviceNode(
        nodeName: json["nodeName"],
        next: json["next"],
        nextFail: json["nextFail"],
        text: json["text"],
        origin: Output.fromJson(json["origin"]),
        weight: Weight.fromJson(json["weight"]),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "next": next,
        "nextFail": nextFail,
        "text": text,
        "origin": origin!.toJson(),
        "weight": weight!.toJson(),
      };
}

class Weight {
  Weight({
    this.name,
    this.type,
    this.range,
  });

  String? name;
  Type? type;
  Range? range;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        name: json["name"],
        type: typeValues.map![json["type"]],
        range: Range.fromJson(json["range"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
        "range": range!.toJson(),
      };
}

class Range {
  Range({
    this.max,
    this.min,
  });

  int? max;
  int? min;

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
      };
}

class Expression {
  Expression({
    this.type,
    this.value,
  });

  Type? type;
  dynamic? value;

  factory Expression.fromJson(Map<String, dynamic> json) => Expression(
        type: typeValues.map![json["type"]],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "value": value,
      };
}

enum Type { BOOLEAN, STRING, OBJECT, INTEGER }

final typeValues = EnumValues({
  "Boolean": Type.BOOLEAN,
  "Integer": Type.INTEGER,
  "Object": Type.OBJECT,
  "String": Type.STRING
});

class Output {
  Output({
    this.name,
    this.type,
  });

  String? name;
  Type? type;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
        name: json["name"],
        type: typeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
      };
}

class EndNode {
  EndNode({
    this.nodeName,
  });

  String? nodeName;

  factory EndNode.fromJson(Map<String, dynamic> json) => EndNode(
        nodeName: json["nodeName"],
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
      };
}

class IoNode {
  IoNode({
    this.nodeName,
    this.elements,
  });

  String? nodeName;
  List<Element>? elements;

  factory IoNode.fromJson(Map<String, dynamic> json) => IoNode(
        nodeName: json["nodeName"],
        elements: List<Element>.from(
            json["elements"].map((x) => Element.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodeName": nodeName,
        "elements": List<dynamic>.from(elements!.map((x) => x.toJson())),
      };
}

class Element {
  Element({
    this.textViewElement,
    this.twoButtonElement,
  });

  TextViewElement? textViewElement;
  TwoButtonElement? twoButtonElement;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        textViewElement: json["TextViewElement"] == null
            ? null
            : TextViewElement.fromJson(json["TextViewElement"]),
        twoButtonElement: json["TwoButtonElement"] == null
            ? null
            : TwoButtonElement.fromJson(json["TwoButtonElement"]),
      );

  Map<String, dynamic> toJson() => {
        "TextViewElement":
            textViewElement == null ? null : textViewElement!.toJson(),
        "TwoButtonElement":
            twoButtonElement == null ? null : twoButtonElement!.toJson(),
      };
}

class TextViewElement {
  TextViewElement({
    this.text,
  });

  String? text;

  factory TextViewElement.fromJson(Map<String, dynamic> json) =>
      TextViewElement(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class CtgDeviceNode {
  CtgDeviceNode({
    this.nodeName,
    this.next,
    this.nextFail,
    this.text,
    this.origin,
    this.fhr,
    this.mhr,
    this.qfhr,
    this.toco,
    this.signal,
    this.signalToNoise,
    this.fetalHeight,
    this.voltageStart,
    this.voltageEnd,
    this.startTime,
    this.endTime,
    this.uaDelay,
  });

  String? nodeName;
  String? next;
  String? nextFail;
  String? text;
  Output? origin;
  Output? fhr;
  Output? mhr;
  Output? qfhr;
  Output? toco;
  Output? signal;
  Output? signalToNoise;
  Output? fetalHeight;
  Output? voltageStart;
  Output? voltageEnd;
  Output? startTime;
  Output? endTime;
  Output? uaDelay;

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
        "origin": origin!.toJson(),
        "fhr": fhr!.toJson(),
        "mhr": mhr!.toJson(),
        "qfhr": qfhr!.toJson(),
        "toco": toco!.toJson(),
        "signal": signal!.toJson(),
        "signalToNoise": signalToNoise!.toJson(),
        "fetalHeight": fetalHeight!.toJson(),
        "voltageStart": voltageStart!.toJson(),
        "voltageEnd": voltageEnd!.toJson(),
        "startTime": startTime!.toJson(),
        "endTime": endTime!.toJson(),
        "uaDelay": uaDelay!.toJson(),
      };
}

class TwoButtonElement {
  TwoButtonElement({
    this.leftText,
    this.leftNext,
    this.rightText,
    this.rightNext,
  });

  String? leftText;
  String? leftNext;
  String? rightText;
  String? rightNext;

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

class SaturationDeviceNode {
  SaturationDeviceNode({
    this.nodeName,
    this.next,
    this.nextFail,
    this.text,
    this.origin,
    this.saturation,
    this.pulse,
  });

  String? nodeName;
  String? next;
  String? nextFail;
  String? text;
  Output? origin;
  Output? saturation;
  Output? pulse;

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
        "origin": origin!.toJson(),
        "saturation": saturation!.toJson(),
        "pulse": pulse!.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
