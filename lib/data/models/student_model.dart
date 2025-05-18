class StudentModel {
  String? id;
  String? fullName;
  String? branch;
  String? avatar;
  String? personalID;
  String? university;
  String? faculty;
  String? trackID;
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
  List<Certificate>? certificates;
  int? v;

  StudentModel({
    this.id,
    this.fullName,
    this.branch,
    this.avatar,
    this.personalID,
    this.university,
    this.faculty,
    this.trackID,
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
    this.certificates,
    this.v,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json["_id"],
    fullName: json["fullName"],
    branch: json["branch"],
    avatar: json["avatar"],
    personalID: json["personalID"],
    university: json["university"],
    faculty: json["faculty"],
    trackID: json["trackID"],
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
    jobs:
        json["jobs"] != null
            ? List<Job>.from(json["jobs"].map((x) => Job.fromJson(x)))
            : null,
    certificates:
        json["certificates"] != null
            ? List<Certificate>.from(
              json["certificates"].map((x) => Certificate.fromJson(x)),
            )
            : null,
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "branch": branch,
    "avatar": avatar,
    "personalID": personalID,
    "university": university,
    "faculty": faculty,
    "trackID": trackID,
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
    "jobs":
        jobs != null ? List<dynamic>.from(jobs!.map((x) => x.toJson())) : null,
    "certificates":
        certificates != null
            ? List<dynamic>.from(certificates!.map((x) => x.toJson()))
            : null,
    "__v": v,
  };
}

class Job {
  String? jobID;
  String? type;
  bool? verified;
  int? costInUSD;
  String? id;

  Job({this.jobID, this.type, this.verified, this.costInUSD, this.id});

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    jobID: json["jobID"],
    type: json["type"],
    verified: json["verified"],
    costInUSD: json["costInUSD"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "jobID": jobID,
    "type": type,
    "verified": verified,
    "costInUSD": costInUSD,
    "_id": id,
  };
}

class Certificate {
  String? certificateID;
  bool? verified;
  String? id;

  Certificate({this.certificateID, this.verified, this.id});

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
    certificateID: json["certificateID"],
    verified: json["verified"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "certificateID": certificateID,
    "verified": verified,
    "_id": id,
  };
}
