///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginDetail {
/*

class Login {
  Login({
    required this.status,
    this.detail,
    required this.message,
  });

  bool status;
  Detail? detail;
  String message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        detail: Detail.fromJson(json["detail"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "detail": detail!.toJson(),
        "message": message,
      };
}

class Detail {
  Detail({
    required this.id,
    required this.roleId,
    required this.email,
  });

  String id;
  String roleId;
  String email;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        roleId: json["role_id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "email": email,
      };
}

{
  "id": "80",
  "role_id": "6",
  "email": "serpil@daynex.com.tr"
} 
*/

  String? id;
  String? roleId;
  String? email;

  LoginDetail({
    this.id,
    this.roleId,
    this.email,
  });
  LoginDetail.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    roleId = json['role_id']?.toString();
    email = json['email']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['email'] = email;
    return data;
  }
}

class Login {
/*
{
  "status": true,
  "detail": {
    "id": "80",
    "role_id": "6",
    "email": "serpil@daynex.com.tr"
  },
  "message": "Giriş Başarılı."
} 
*/

  bool? status;
  LoginDetail? detail;
  String? message;

  Login({
    this.status,
    this.detail,
    this.message,
  });
  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    detail =
        (json['detail'] != null) ? LoginDetail.fromJson(json['detail']) : null;
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    data['message'] = message;
    return data;
  }
}