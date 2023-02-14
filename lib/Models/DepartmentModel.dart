import 'package:flutter/services.dart';

class DepartmentModel {
  String? sId;
  String? name;
  String? abbreviation;
  String? description;
  String? parent;
  List<DepartmentModel>? child;
  String? chairmanName;
  List<String>? programs;
  List? ancestors;
  String? image;

  DepartmentModel(
      {this.sId,
      this.name,
      this.abbreviation,
      this.description,
      this.parent,
      this.child,
      this.chairmanName,
      this.programs,
      this.ancestors,
      this.image});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json["image"];
    name = json['name'];
    abbreviation = json['abbreviation'];
    description = json['description'];
    parent = json['parent'];
    if (json['child'] != null) {
      child = <DepartmentModel>[];
      json['child'].forEach((v) {
        child!.add(DepartmentModel.fromJson(v));
      });
    }
    chairmanName = json['chairman_name'];
    programs = json['programs'].cast<String>();
    if (json['ancestors'] != null) {
      ancestors = [];
      json['ancestors'].forEach((v) {
        ancestors!.add(v);
      });
    }
  }
}

class ProgramWrapper {
  List<String>? programs;
  set taskModelList(List<String> taskModelList) {
    programs = taskModelList;
  }

  get program => programs;
}
