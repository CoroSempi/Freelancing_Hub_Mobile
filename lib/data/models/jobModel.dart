class JobData {
  String? id;
  String? jobTitle;
  String? jobType;
  String? uploadedBy;
  String? studentName;
  String? branch;
  String? jobDescription;
  String? startDate;
  String? endDate;
  int? costInUSD;
  int? costInEGP
  ;
  int? studentShare;
  String? clientName;
  String? clientCountry;
  String? platform;
  String? clientContact;
  String? proofOfWork;
  bool? verified;
  List<dynamic>? comments;
  List<TeamMemberModel>? teamMembers;
  int? v;

  JobData({
    this.id,
    this.jobTitle,
    this.jobType,
    this.uploadedBy,
    this.studentName,
    this.teamMembers,
    this.branch,
    this.jobDescription,
    this.startDate,
    this.endDate,
    this.costInUSD,
    this.costInEGP,
    this.studentShare,
    this.clientName,
    this.clientCountry,
    this.platform,
    this.clientContact,
    this.proofOfWork,
    this.verified,
    this.comments,
    this.v,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      id: json['_id']?.toString(),
      jobTitle: json['jobTitle']?.toString(),
      jobType: json['jobType']?.toString(),
      uploadedBy: json['uploadedBy']?.toString(),
      studentName: json['studentName']?.toString(),
      branch: json['branch']?.toString(),
      jobDescription: json['jobDescription']?.toString(),
      startDate: json['startDate']?.toString(),
      endDate: json['endDate']?.toString(),
      costInUSD: (json['costInUSD'] as num?)?.toInt(),
      costInEGP: (json['costInEGP'] as num?)?.toInt(),
      studentShare: (json['studentShare'] as num?)?.toInt(),
      clientName: json['clientName']?.toString(),
      clientCountry: json['clientCountry']?.toString(),
      platform: json['platform']?.toString(),
      clientContact: json['clientContact']?.toString(),
      proofOfWork: json['proofOfWork']?.toString(),
      verified: json['verified'] as bool?,
      comments: json['comments'] is List ? List<dynamic>.from(json['comments']) : [],
teamMembers: json['teamMembers'] != null
    ? (json['teamMembers'] as List)
        .map((e) => TeamMemberModel.fromJson(e))
        .toList()
    : [],
      v: (json['__v'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'jobTitle': jobTitle,
      'jobType': jobType,
      'uploadedBy': uploadedBy,
      'studentName': studentName,
'teamMembers': teamMembers?.map((e) => e.toJson()).toList(),
      'branch': branch,
      'jobDescription': jobDescription,
      'startDate': startDate,
      'endDate': endDate,
      'costInUSD': costInUSD,
      'costInEGP': costInEGP,
      'studentShare': studentShare,
      'clientName': clientName,
      'clientCountry': clientCountry,
      'platform': platform,
      'clientContact': clientContact,
      'proofOfWork': proofOfWork,
      'verified': verified,
      'comments': comments,
      '__v': v,
    };
  }

  @override
  String toString() {
    return 'JobData{id: $id, jobTitle: $jobTitle, jobType: $jobType, uploadedBy: $uploadedBy, studentName: $studentName, branch: $branch, jobDescription: $jobDescription, startDate: $startDate, endDate: $endDate, costInUsd: $costInUSD, costInEgp: $costInEGP, studentShare: $studentShare, clientName: $clientName, clientCountry: $clientCountry, platform: $platform, clientContact: $clientContact, proofOfWork: $proofOfWork, verified: $verified, comments: $comments, v: $v}';
  }
}

class TeamMemberModel {
  final String studentID;
  final String studentName;
  final int studentShare;
  final String id;

  TeamMemberModel({
    required this.studentID,
    required this.studentName,
    required this.studentShare,
    required this.id,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      studentID: json['studentID'] ?? '',
      studentName: json['studentName'] ?? '',
      studentShare: json['studentShare'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentID': studentID,
      'studentName': studentName,
      'studentShare': studentShare,
      '_id': id,
    };
  }
}
