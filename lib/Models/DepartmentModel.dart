import 'package:flutter/services.dart';

class DepartmentModel {
  String? sId;
  String? name;
  String? abbreviation;
  String? description;
  String? parent;
  List<Child>? child;
  String? chairmanName;
  List<String>? programs;
  List<Ancestor>? ancestors;
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
      child = <Child>[];
      json['child'].forEach((v) {
        child!.add(new Child.fromJson(v));
      });
    }
    chairmanName = json['chairman_name'];
    programs = json['programs'].cast<String>();
    if (json['ancestors'] != null) {
      ancestors = <Ancestor>[];
      json['ancestors'].forEach((v) {
        ancestors!.add(Ancestor.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Child {
  String? sId;
  String? name;
  String? abbreviation;
  String? description;
  String? parent;
  List<Child>? child;
  String? chairmanName;
  List<String>? programs;
  List<Ancestor>? ancestors;
  String? createdAt;
  String? updatedAt;
  ByteData? image;

  Child(
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

  Child.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    abbreviation = json['abbreviation'];
    description = json['description'];
    parent = json['parent'];
    if (json['child'] != null) {
      child = <Child>[];
      json['child'].forEach((v) {
        child!.add(new Child.fromJson(v));
      });
    }
    chairmanName = json['chairman_name'];
    programs = json['programs'].cast<String>();
    if (json['ancestors'] != null) {
      ancestors = <Ancestor>[];
      json['ancestors'].forEach((v) {
        ancestors!.add(Ancestor.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Ancestor {
  String? sId;

  Ancestor({this.sId});

  Ancestor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }
}
