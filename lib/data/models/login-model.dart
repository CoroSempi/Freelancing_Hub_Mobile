import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String accessToken;
  StudentData studentData;

  LoginResponse({required this.accessToken, required this.studentData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    accessToken: json["AccessToken"],
    studentData: StudentData.fromJson(json["studentData"]),
  );

  Map<String, dynamic> toJson() => {
    "AccessToken": accessToken,
    "studentData": studentData.toJson(),
  };
}

class StudentData {
  String? id;
  String? fullName;
  String? branch;
  String? avatar;
  String? personalId;
  String? university;
  String? faculty;
  String? trackId;
  String? trackName;
  int? graduationYear;
  String? graduationGrade;
  String? phone;
  String? email;
  String? password;
  int? verificationCode;
  String? gender;
  String? governorate;
  String? address;
  bool? target;
  List<Job>? jobs;
  int? v;
  List<Certificate>? certificates;

  StudentData({
    this.id,
    this.fullName,
    this.branch,
    this.avatar,
    this.personalId,
    this.university,
    this.faculty,
    this.trackId,
    this.trackName,
    this.graduationYear,
    this.graduationGrade,
    this.phone,
    this.email,
    this.password,
    this.verificationCode,
    this.gender,
    this.governorate,
    this.address,
    this.target,
    this.jobs,
    this.v,
    this.certificates,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
    id: json["_id"] ?? '',
    fullName: json["fullName"] ?? '',
    branch: json["branch"] ?? '',
    avatar: json["avatar"] ?? '',
    personalId: json["personalID"] ?? '',
    university: json["university"] ?? '',
    faculty: json["faculty"] ?? '',
    trackId: json["trackID"] ?? '',
    trackName: json["trackName"] ?? '',
    graduationYear: json["graduationYear"] ?? 0,
    graduationGrade: json["graduationGrade"] ?? '',
    phone: json["phone"] ?? '',
    email: json["email"] ?? '',
    password: json["password"] ?? '',
    verificationCode: json["verificationCode"] ?? 0,
    gender: json["gender"] ?? '',
    governorate: json["governorate"] ?? '',
    address: json["address"] ?? '',
    target: json["target"] ?? false,
    jobs:
        json["jobs"] != null
            ? List<Job>.from(json["jobs"].map((x) => Job.fromJson(x)))
            : [],
    v: json["__v"] ?? 0,
    certificates:
        json["certificates"] != null
            ? List<Certificate>.from(
              json["certificates"].map((x) => Certificate.fromJson(x)),
            )
            : [],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "branch": branch,
    "avatar": avatar,
    "personalID": personalId,
    "university": university,
    "faculty": faculty,
    "trackID": trackId,
    "trackName": trackName,
    "graduationYear": graduationYear,
    "graduationGrade": graduationGrade,
    "phone": phone,
    "email": email,
    "password": password,
    "verificationCode": verificationCode,
    "gender": gender,
    "governorate": governorate,
    "address": address,
    "target": target,
    "jobs": jobs?.map((x) => x.toJson()).toList(),
    "__v": v,
    "certificates": certificates?.map((x) => x.toJson()).toList(),
  };
}

class Job {
  String jobId;
  String type;
  bool verified;
  int costInUsd;
  String id;

  Job({
    required this.jobId,
    required this.type,
    required this.verified,
    required this.costInUsd,
    required this.id,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    jobId: json["jobID"],
    type: json["type"],
    verified: json["verified"],
    costInUsd: json["costInUSD"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "jobID": jobId,
    "type": type,
    "verified": verified,
    "costInUSD": costInUsd,
    "_id": id,
  };
}

class Certificate {
  String certificateId;
  bool verified;
  String id;

  Certificate({
    required this.certificateId,
    required this.verified,
    required this.id,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
    certificateId: json["certificateID"],
    verified: json["verified"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "certificateID": certificateId,
    "verified": verified,
    "_id": id,
  };
}
