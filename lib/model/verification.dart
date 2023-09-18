class Verification {
  String id;
  final String idType;
  final String? selfieUrl;
  final String? idUrl;

  Verification(
      {required this.id,
        required this.idType,
        required this.selfieUrl,
        required this.idUrl}
      );

}

class Verifications {
  final List<Verification> verifications;
  Verifications(
      { required this.verifications});

  factory Verifications.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<Verification> verifications = data
        .map((verification) => Verification(
        id: verification['_id'],
        idType: verification['id_type'],
        selfieUrl: verification['selfie_url'],
        idUrl: verification['id_url']
    ))
        .toList();
    return Verifications(verifications: verifications);
  }


  static List<Verifications> parseVerifications(dynamic responseBody) {
    final parsed = responseBody as List<dynamic>;
    return parsed.map<Verifications>((json) => Verifications.fromJson(json)).toList();
  }
}