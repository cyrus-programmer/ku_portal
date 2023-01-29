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
  String? createdAt;
  String? updatedAt;
  ByteData? image;

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
      this.createdAt,
      this.updatedAt,
      this.image});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json[image];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
