class Comment {
  final String id;
  final String content;
  final int rate;
  final DateTime date;

  Comment({//clientContact
    required this.id,
    required this.content,
    required this.rate,
    required this.date,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['_id'],
        content: json['content'],
        rate: json['rate'],
        date: DateTime.parse(json['date']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'content': content,
        'rate': rate,
        'date': date.toIso8601String(),
      };
}

class TeamMember {
  final String id;
  final String studentID;
  final String studentName;
  final int studentShare;

  TeamMember({
    required this.id,
    required this.studentID,
    required this.studentName,
    required this.studentShare,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        id: json['_id'],
        studentID: json['studentID'],
        studentName: json['studentName'],
        studentShare: json['studentShare'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'studentID': studentID,
        'studentName': studentName,
        'studentShare': studentShare,
      };
}

class JobDetails {
  final String id;
  final String jobTitle;
  final String jobType;
  final String uploadedBy;
  final String studentName;
  final String branch;
  final String jobDescription;
  final DateTime startDate;

  final int? paymentInUSD;
  final int? paymentInEGP;

  final int? costInUSD;
  final int? costInEGP;

  final DateTime? endDate;

  final int? studentShare;
  final List<TeamMember>? teamMembers;

  final String? studentProfile;

  final String? clientName;
  final String? clientCountry;
  final String? platform;
  final String? clientProfile;
final String?  clientContact;
  final String? companytName;
  final String? companyCountry;
  final String? companyContact;

  final String? proofOfWork;
  final bool verified;
  final List<Comment> comments;

  final int? v;

  JobDetails({
    required this.id,
    required this.jobTitle,
    required this.jobType,
    required this.uploadedBy,
    required this.studentName,
    required this.branch,
    required this.jobDescription,
    required this.startDate,
    this.paymentInUSD,
    this.paymentInEGP,
    this.costInUSD,
    this.costInEGP,
    this.endDate,
    this.studentShare,
    this.teamMembers,
    this.studentProfile,
    this.clientName,
    this.clientCountry,
    this.platform,
    this.clientProfile,
    this.companytName,
    this.companyCountry,
    this.companyContact,
    this.proofOfWork,
    this.clientContact,
    required this.verified,
    required this.comments,
    this.v,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        id: json['_id'],
        jobTitle: json['jobTitle'],
        jobType: json['jobType'],
        uploadedBy: json['uploadedBy'],
        studentName: json['studentName'],
        branch: json['branch'],
        jobDescription: json['jobDescription'],
        startDate: DateTime.parse(json['startDate']),
        paymentInUSD: json['paymentInUSD'],
        paymentInEGP: json['paymentInEGP'],
        costInUSD: json['costInUSD'],
        costInEGP: json['costInEGP'],
        endDate:
            json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
        studentShare: json['studentShare'],
        teamMembers: json['teamMembers'] != null
            ? List<TeamMember>.from(
                json['teamMembers'].map((x) => TeamMember.fromJson(x)))
            : null,
        studentProfile: json['studentProfile'],
        clientName: json['clientName'],
        clientCountry: json['clientCountry'],
        platform: json['platform'],
        clientProfile: json['clientProfile'],
        clientContact:json['clientContact'],
        companytName: json['companytName'],
        companyCountry: json['companyCountry'],
        companyContact: json['companyContact'],
        proofOfWork: json['proofOfWork'],
        verified: json['verified'],
        comments: json['comments'] != null
            ? List<Comment>.from(json['comments'].map((x) => Comment.fromJson(x)))
            : [],
        v: json['__v'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'jobTitle': jobTitle,
        'jobType': jobType,
        'uploadedBy': uploadedBy,
        'studentName': studentName,
        'branch': branch,
        'jobDescription': jobDescription,
        'startDate': startDate.toIso8601String(),
        'paymentInUSD': paymentInUSD,
        'paymentInEGP': paymentInEGP,
        'costInUSD': costInUSD,
        'costInEGP': costInEGP,
        'endDate': endDate?.toIso8601String(),
        'studentShare': studentShare,
        'teamMembers': teamMembers?.map((x) => x.toJson()).toList(),
        'studentProfile': studentProfile,
        'clientName': clientName,
        'clientCountry': clientCountry,
        'platform': platform,
        'clientProfile': clientProfile,
        'companytName': companytName,
        'companyCountry': companyCountry,
        'companyContact': companyContact,
        'proofOfWork': proofOfWork,
        'verified': verified,
        'comments': comments.map((x) => x.toJson()).toList(),
        '__v': v,
      };
}


class JobDetailsResponse {
  final JobDetails jobData;
  final bool canEdit;

  JobDetailsResponse({
    required this.jobData,
    required this.canEdit,
  });

  factory JobDetailsResponse.fromJson(Map<String, dynamic> json) {
    return JobDetailsResponse(
      jobData: JobDetails.fromJson(json['jobData']),
      canEdit: json['canEdit'] ?? false,
    );
  }
}




