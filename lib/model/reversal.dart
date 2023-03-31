class Reversal {
  String id;
  String status;
  String phoneNumber;
  String amount;
  String reversalDate;
  String recipientName;
  Reversal({
    required this.id,
    required this.status,
    required this.phoneNumber,
    required this.amount,
    required this.reversalDate,
    required this.recipientName,
  });

  factory Reversal.fromJson(Map<String, dynamic> json) {
    return Reversal(
        id: json['id'],
        status: json['status'],
        phoneNumber: json['phoneNumber'],
        amount: json['amount'],
        reversalDate: json['reversalDate'],
        recipientName: json['recipientName']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'phoneNumber': phoneNumber,
        'amount': amount,
        'reversalDate': reversalDate,
        'recipientName': recipientName
      };
}
