// student_model.dart
class StudentModel {
  String id;
  String fullName;
  String branch;
  String avatar;
  String personalID;
  String university;
  String faculty;
  String trackID;
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
  List<Certificate> certificates;

  StudentModel({
    required this.id,
    required this.fullName,
    required this.branch,
    required this.avatar,
    required this.personalID,
    required this.university,
    required this.faculty,
    required this.trackID,
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
    required this.certificates,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      branch: json['branch'] ?? '',
      avatar: json['avatar'] ?? '',
      personalID: json['personalID'] ?? '',
      university: json['university'] ?? '',
      faculty: json['faculty'] ?? '',
      trackID: json['trackID'] ?? '',
      trackName: json['trackName'] ?? '',
      graduationYear: json['graduationYear'] ?? 0,
      graduationGrade: json['graduationGrade'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      verificationCode: json['verificationCode'] ?? 0,
      gender: json['gender'] ?? '',
      governorate: json['governorate'] ?? '',
      address: json['address'] ?? '',
      target: json['target'] ?? false,
      jobs: (json['jobs'] as List?)?.map((e) => Job.fromJson(e)).toList() ?? [],
      certificates: (json['certificates'] as List?)?.map((e) => Certificate.fromJson(e)).toList() ?? [],
    );
  }
}

class Job {
  String jobID;
  String type;
  bool verified;
  int costInUSD;
  String id;

  Job({
    required this.jobID,
    required this.type,
    required this.verified,
    required this.costInUSD,
    required this.id,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobID: json['jobID'] ?? '',
      type: json['type'] ?? '',
      verified: json['verified'] ?? false,
      costInUSD: json['costInUSD'] ?? 0,
      id: json['_id'] ?? '',
    );
  }
}

class Certificate {
  String certificateID;
  bool verified;
  String id;

  Certificate({
    required this.certificateID,
    required this.verified,
    required this.id,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateID: json['certificateID'] ?? '',
      verified: json['verified'] ?? false,
      id: json['_id'] ?? '',
    );
  }
}