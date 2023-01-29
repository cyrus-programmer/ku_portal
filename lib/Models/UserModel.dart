class UserModel {
  String? sId;
  String? seatNumber;
  String? adminId;
  String? firstName;
  String? lastName;
  String? email;
  int? phone;
  bool? isPassOut;
  String? role;
  bool? isDeleted;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
      this.seatNumber,
      this.adminId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.isPassOut,
      this.role,
      this.isDeleted,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});
  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    seatNumber = json['seat_number'];
    adminId = json['admin_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    isPassOut = json['is_pass_out'];
    role = json['role'];
    isDeleted = json['is_deleted'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }
}
