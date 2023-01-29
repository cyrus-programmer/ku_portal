class ActivityModel {
  String? id;
  String? name;
  String? dept;
  String? sem, url;
  String? charges;

  ActivityModel({
    this.id,
    this.name,
    this.dept,
    this.sem,
    this.url,
    this.charges,
  });
  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    dept = json['department'];
    charges = json['charges'];
    sem = json['timing'];
    url = json['url'];
  }
}
