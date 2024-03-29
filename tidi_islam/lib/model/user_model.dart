///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UserModel {
/*
{
  "user_id": "80",
  "firstname": "Daynex",
  "lastname": "Editör",
  "image": "tid-turk-isret-dilinde-islam1.png",
  "telephone": "02125081508",
  "role_name": "Kullanıcı",
  "email": "serpil@daynex.com.tr",
  "company": "Daynex Yazılım A.Ş",
  "city_id": "34",
  "district_id": "17",
  "video_asistan": "1"
} 
*/

  String? userId;
  String? firstname;
  String? lastname;
  String? image;
  String? telephone;
  String? roleName;
  String? email;
  String? company;
  String? cityId;
  String? districtId;
  String? videoAsistan;

  UserModel({
    this.userId,
    this.firstname,
    this.lastname,
    this.image,
    this.telephone,
    this.roleName,
    this.email,
    this.company,
    this.cityId,
    this.districtId,
    this.videoAsistan,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id']?.toString();
    firstname = json['firstname']?.toString();
    lastname = json['lastname']?.toString();
    image = json['image']?.toString();
    telephone = json['telephone']?.toString();
    roleName = json['role_name']?.toString();
    email = json['email']?.toString();
    company = json['company']?.toString();
    cityId = json['city_id']?.toString();
    districtId = json['district_id']?.toString();
    videoAsistan = json['video_asistan']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['image'] = image;
    data['telephone'] = telephone;
    data['role_name'] = roleName;
    data['email'] = email;
    data['company'] = company;
    data['city_id'] = cityId;
    data['district_id'] = districtId;
    data['video_asistan'] = videoAsistan;
    return data;
  }
}
