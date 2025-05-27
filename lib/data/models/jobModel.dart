class JobData {
  final String? id;
  final String? jobTitle;
  final String? jobType;
  final String? uploadedBy;
  final String? studentName;
  final String? branch;
  final String? jobDescription;
  final DateTime startDate;
  final DateTime? endDate;
  final int? costInUSD;
  final int? costInEGP;
  final int? studentShare;
  final int? paymentInUSD;
  final int? paymentInEGP;
  final String? clientName;
  final String? clientCountry;
  final String? platform;
  final String? clientContact;
  final String? proofOfWork;
  final String? companytName;
  final String? companyCountry;
  final String? companyContact;
  final bool? verified;
  final List<dynamic>? comments;
  final List<TeamMemberModel>? teamMembers;
  final int? v;

  JobData({
    this.id,
    this.jobTitle,
    this.jobType,
    this.uploadedBy,
    this.studentName,
    this.branch,
    this.jobDescription,
    required this.startDate,
    this.endDate,
    this.costInUSD,
    this.costInEGP,
    this.studentShare,
    this.paymentInUSD,
    this.paymentInEGP,
    this.clientName,
    this.clientCountry,
    this.platform,
    this.clientContact,
    this.proofOfWork,
    this.companytName,
    this.companyCountry,
    this.companyContact,
    this.verified,
    this.comments,
    this.teamMembers,
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
      startDate: DateTime.parse(json['startDate']),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      costInUSD: (json['costInUSD'] as num?)?.toInt(),
      costInEGP: (json['costInEGP'] as num?)?.toInt(),
      studentShare: (json['studentShare'] as num?)?.toInt(),
      paymentInUSD: (json['paymentInUSD'] as num?)?.toInt(),
      paymentInEGP: (json['paymentInEGP'] as num?)?.toInt(),
      clientName: json['clientName']?.toString(),
      clientCountry: json['clientCountry']?.toString(),
      platform: json['platform']?.toString(),
      clientContact: json['clientContact']?.toString(),
      proofOfWork: json['proofOfWork']?.toString(),
      companytName: json['companytName']?.toString(),
      companyCountry: json['companyCountry']?.toString(),
      companyContact: json['companyContact']?.toString(),
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
      'branch': branch,
      'jobDescription': jobDescription,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'costInUSD': costInUSD,
      'costInEGP': costInEGP,
      'studentShare': studentShare,
      'paymentInUSD': paymentInUSD,
      'paymentInEGP': paymentInEGP,
      'clientName': clientName,
      'clientCountry': clientCountry,
      'platform': platform,
      'clientContact': clientContact,
      'proofOfWork': proofOfWork,
      'companytName': companytName,
      'companyCountry': companyCountry,
      'companyContact': companyContact,
      'verified': verified,
      'comments': comments,
      'teamMembers': teamMembers?.map((e) => e.toJson()).toList(),
      '__v': v,
    };
  }

  @override
  String toString() {
    return 'JobData{id: $id, jobTitle: $jobTitle, jobType: $jobType, uploadedBy: $uploadedBy, studentName: $studentName, branch: $branch, jobDescription: $jobDescription, startDate: $startDate, endDate: $endDate, costInUsd: $costInUSD, costInEgp: $costInEGP, studentShare: $studentShare, paymentInUSD: $paymentInUSD, paymentInEGP: $paymentInEGP, clientName: $clientName, clientCountry: $clientCountry, platform: $platform, clientContact: $clientContact, proofOfWork: $proofOfWork, companytName: $companytName, companyCountry: $companyCountry, companyContact: $companyContact, verified: $verified, comments: $comments, v: $v}';
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
