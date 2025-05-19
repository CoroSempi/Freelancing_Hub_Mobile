class CertificateData {
  String? company;
  String? studentName;
  String? certificateDescription;
  String? startDate;
  String? endDate;
  String? verified ;

  CertificateData({
    this.company,
    this.studentName,
    this.certificateDescription,
    this.startDate,
    this.endDate,
    this.verified,
  });

  factory CertificateData.fromJson(Map<String, dynamic> json) {
    return CertificateData(
      company: json['Company']?.toString(),
      studentName: json['studentName']?.toString(),
      certificateDescription: json['certificateDescription']?.toString(),
      startDate: json['startDate']?.toString(),
      endDate: json['endDate']?.toString(),
      verified: json['verified']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Company': company,
      'studentName': studentName,
      'certificateDescription': certificateDescription,
      'startDate': startDate,
      'endDate': endDate,
      'verified': verified,
    };
  }

  @override
  String toString() {
    return 'CertificateData{company: $company, studentName: $studentName, certificateDescription: $certificateDescription, startDate: $startDate, endDate: $endDate}';
  }
}
