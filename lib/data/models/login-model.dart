import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String accessToken;
  StudentData studentData;

  LoginResponse({
    required this.accessToken,
    required this.studentData,
  });

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
  String id;
  String fullName;
  String branch;
  String avatar;
  String personalId;
  String university;
  String faculty;
  String trackId;
  String trackName;
  int graduationYear;
  String graduationGrade;
  String phone;
  String email;
  String password;
  int verificationCode;
  String gender;
  String governorate;
  String address;
  bool target;
  List<Job> jobs;
  int v;
  List<Certificate> certificates;

  StudentData({
    required this.id,
    required this.fullName,
    required this.branch,
    required this.avatar,
    required this.personalId,
    required this.university,
    required this.faculty,
    required this.trackId,
    required this.trackName,
    required this.graduationYear,
    required this.graduationGrade,
    required this.phone,
    required this.email,
    required this.password,
    required this.verificationCode,
    required this.gender,
    required this.governorate,
    required this.address,
    required this.target,
    required this.jobs,
    required this.v,
    required this.certificates,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        id: json["_id"],
        fullName: json["fullName"],
        branch: json["branch"],
        avatar: json["avatar"],
        personalId: json["personalID"],
        university: json["university"],
        faculty: json["faculty"],
        trackId: json["trackID"],
        trackName: json["trackName"],
        graduationYear: json["graduationYear"],
        graduationGrade: json["graduationGrade"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        verificationCode: json["verificationCode"],
        gender: json["gender"],
        governorate: json["governorate"],
        address: json["address"],
        target: json["target"],
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
        v: json["__v"],
        certificates: List<Certificate>.from(json["certificates"].map((x) => Certificate.fromJson(x))),
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
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
        "__v": v,
        "certificates": List<dynamic>.from(certificates.map((x) => x.toJson())),
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