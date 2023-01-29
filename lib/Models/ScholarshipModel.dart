class ScholarshipModel {
  String? id;
  String? name;
  String? department;
  String? semester;
  String? charges;
  String? url;

  ScholarshipModel({
    this.id,
    this.name,
    this.department,
    this.semester,
    this.charges,
    this.url,
  });

  ScholarshipModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    department = json['department'];
    semester = json['semester'];
    charges = json['charges'];
    url = json['url'];
  }
}
