class CertificateModel {
  final String id;
  final String certificateId;
  final String type;
  final String uploadedBy;
  final String studentName;
  final String branch;
  final String certificateDescription;
  final String startDate;
  final String endDate;
  final String company;
  final String approach;
  final String proofOfCertificate;
  final bool verified;

  CertificateModel({
    required this.id,
    required this.certificateId,
    required this.type,
    required this.uploadedBy,
    required this.studentName,
    required this.branch,
    required this.certificateDescription,
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.approach,
    required this.proofOfCertificate,
    required this.verified,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['_id'] ?? '',
      certificateId: json['certificateId'] ?? '',
      type: json['Type'] ?? '',
      uploadedBy: json['uploadedBy'] ?? '',
      studentName: json['studentName'] ?? '',
      branch: json['branch'] ?? '',
      certificateDescription: json['certificateDescription'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      company: json['Company'] ?? '',
      approach: json['approach'] ?? '',
      proofOfCertificate: json['proofOfCertificate'] ?? '',
      verified: json['verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'certificateId': certificateId,
      'Type': type,
      'uploadedBy': uploadedBy,
      'studentName': studentName,
      'branch': branch,
      'certificateDescription': certificateDescription,
      'startDate': startDate,
      'endDate': endDate,
      'Company': company,
      'approach': approach,
      'proofOfCertificate': proofOfCertificate,
      'verified': verified,
    };
  }
}
