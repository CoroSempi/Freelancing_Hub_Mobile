class CertificateData {
  String? id;
  String? certificateId;
  String? company;
  String? studentName;
  String? certificateDescription;
  String? startDate;
  String? endDate;
  bool? verified;
  String? branch;
  String? approach;
  String? proofOfCertificate;

  CertificateData({
    this.id,
    this.certificateId,
    this.company,
    this.studentName,
    this.certificateDescription,
    this.startDate,
    this.endDate,
    this.verified,
    this.branch,
    this.approach,
    this.proofOfCertificate,
  });

  factory CertificateData.fromJson(Map<String, dynamic> json) {
    return CertificateData(
      id: json['_id']?.toString(),
      certificateId: json['certificateId']?.toString(),
      company: json['Company']?.toString(),
      studentName: json['studentName']?.toString(),
      certificateDescription: json['certificateDescription']?.toString(),
      startDate: json['startDate']?.toString(),
      endDate: json['endDate']?.toString(),
      verified: json['verified'] as bool?,
      branch: json['branch']?.toString(),
      approach: json['approach']?.toString(),
      proofOfCertificate: json['proofOfCertificate']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'certificateId': certificateId,
      'Company': company,
      'studentName': studentName,
      'certificateDescription': certificateDescription,
      'startDate': startDate,
      'endDate': endDate,
      'verified': verified,
      'branch': branch,
      'approach': approach,
      'proofOfCertificate': proofOfCertificate,
    };
  }

  @override
  String toString() {
    return 'CertificateData{certificateId: $certificateId, company: $company, studentName: $studentName, certificateDescription: $certificateDescription, startDate: $startDate, endDate: $endDate, verified: $verified, branch: $branch, approach: $approach, proofOfCertificate: $proofOfCertificate}';
  }
}
