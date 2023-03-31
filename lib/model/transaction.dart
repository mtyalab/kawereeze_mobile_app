class Transaction {
  String id;
  String amount;
  String recipientName;
  String transactionDate;
  String status;
  String recipientPhoneNumber;
  Transaction(
      {required this.id,
      required this.amount,
      required this.recipientName,
      required this.transactionDate,
      required this.status,
      required this.recipientPhoneNumber});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id: json['id'],
        amount: json['amount'],
        recipientName: json['recipientName'],
        transactionDate: json['transactionDate'],
        status: json['status'],
        recipientPhoneNumber: json['recipientPhoneNumber']);
  }

  Map<String, dynamic> toJson() => {
        id: 'id',
        amount: 'amount',
        recipientName: 'recipientName',
        transactionDate: 'transactionDate',
        status: 'status',
        recipientPhoneNumber: 'recipientPhoneNumber'
      };
}
