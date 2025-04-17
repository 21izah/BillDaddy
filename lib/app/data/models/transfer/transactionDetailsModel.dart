class TransactionDetails {
  final String userId;
  final String amount;
  final String recipientName;
  final String recipientAccount;
  final String walletId;
  final String userType;
  final String status;
  final String transactionType;
  final String senderAccount;
  final String attribute;
  final String reference;
  final String balanceBefore;
  final String balanceAfter;
  final String recipientBank;
  final dynamic paymentGateway; // Can be null
  final String transactionFee;
  final String total;
  final dynamic description; // Can be null
  final String transactionChannel;
  final dynamic details; // Can be null
  final dynamic rejectReason; // Can be null
  final String id;
  final String transactionCharge;
  final String createdAt;
  final String updatedAt;

  TransactionDetails({
    required this.userId,
    required this.amount,
    required this.recipientName,
    required this.recipientAccount,
    required this.walletId,
    required this.userType,
    required this.status,
    required this.transactionType,
    required this.senderAccount,
    required this.attribute,
    required this.reference,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.recipientBank,
    this.paymentGateway,
    required this.transactionFee,
    required this.total,
    this.description,
    required this.transactionChannel,
    this.details,
    this.rejectReason,
    required this.id,
    required this.transactionCharge,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      userId: json['userId'],
      amount: json['amount'],
      recipientName: json['recipientName'],
      recipientAccount: json['recipientAccount'],
      walletId: json['walletId'],
      userType: json['userType'],
      status: json['status'],
      transactionType: json['transactionType'],
      senderAccount: json['senderAccount'],
      attribute: json['attribute'],
      reference: json['reference'],
      balanceBefore: json['balanceBefore'],
      balanceAfter: json['balanceAfter'],
      recipientBank: json['recipientBank'],
      paymentGateway: json['paymentGateway'],
      transactionFee: json['transactionFee'],
      total: json['total'],
      description: json['description'],
      transactionChannel: json['transactionChannel'],
      details: json['details'],
      rejectReason: json['rejectReason'],
      id: json['id'],
      transactionCharge: json['transactionCharge'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class TransactionResponse {
  final bool success;
  final String message;
  final TransactionDetails transactionDetails;

  TransactionResponse({
    required this.success,
    required this.message,
    required this.transactionDetails,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      success: json['success'],
      message: json['message'],
      transactionDetails:
          TransactionDetails.fromJson(json['data']['transactionDetails']),
    );
  }
}
