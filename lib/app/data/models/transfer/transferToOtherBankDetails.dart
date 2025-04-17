class TransferToOtherBankModel {
  bool? success;
  String? message;
  Data? data;

  TransferToOtherBankModel({this.success, this.message, this.data});

  TransferToOtherBankModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  TransactionDetails? transactionDetails;

  Data({this.transactionDetails});

  Data.fromJson(Map<String, dynamic> json) {
    transactionDetails = json['transactionDetails'] != null
        ? new TransactionDetails.fromJson(json['transactionDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionDetails != null) {
      data['transactionDetails'] = this.transactionDetails!.toJson();
    }
    return data;
  }
}

class TransactionDetails {
  String? userId;
  String? userType;
  String? walletId;
  String? transactionType;
  String? amount;
  String? balanceBefore;
  String? balanceAfter;
  String? senderAccount;
  String? recipientAccount;
  String? recipientName;
  String? recipientBank;
  String? status;
  String? attribute;
  Null? paymentGateway;
  Null? reference;
  String? transactionFee;
  String? total;
  Null? senderName;
  Null? description;
  String? transactionChannel;
  Null? details;
  Null? rejectReason;
  String? id;
  String? transactionCharge;
  String? createdAt;
  String? updatedAt;

  TransactionDetails(
      {this.userId,
      this.userType,
      this.walletId,
      this.transactionType,
      this.amount,
      this.balanceBefore,
      this.balanceAfter,
      this.senderAccount,
      this.recipientAccount,
      this.recipientName,
      this.recipientBank,
      this.status,
      this.attribute,
      this.paymentGateway,
      this.reference,
      this.transactionFee,
      this.total,
      this.senderName,
      this.description,
      this.transactionChannel,
      this.details,
      this.rejectReason,
      this.id,
      this.transactionCharge,
      this.createdAt,
      this.updatedAt});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userType = json['userType'];
    walletId = json['walletId'];
    transactionType = json['transactionType'];
    amount = json['amount'];
    balanceBefore = json['balanceBefore'];
    balanceAfter = json['balanceAfter'];
    senderAccount = json['senderAccount'];
    recipientAccount = json['recipientAccount'];
    recipientName = json['recipientName'];
    recipientBank = json['recipientBank'];
    status = json['status'];
    attribute = json['attribute'];
    paymentGateway = json['paymentGateway'];
    reference = json['reference'];
    transactionFee = json['transactionFee'];
    total = json['total'];
    senderName = json['senderName'];
    description = json['description'];
    transactionChannel = json['transactionChannel'];
    details = json['details'];
    rejectReason = json['rejectReason'];
    id = json['id'];
    transactionCharge = json['transactionCharge'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['walletId'] = this.walletId;
    data['transactionType'] = this.transactionType;
    data['amount'] = this.amount;
    data['balanceBefore'] = this.balanceBefore;
    data['balanceAfter'] = this.balanceAfter;
    data['senderAccount'] = this.senderAccount;
    data['recipientAccount'] = this.recipientAccount;
    data['recipientName'] = this.recipientName;
    data['recipientBank'] = this.recipientBank;
    data['status'] = this.status;
    data['attribute'] = this.attribute;
    data['paymentGateway'] = this.paymentGateway;
    data['reference'] = this.reference;
    data['transactionFee'] = this.transactionFee;
    data['total'] = this.total;
    data['senderName'] = this.senderName;
    data['description'] = this.description;
    data['transactionChannel'] = this.transactionChannel;
    data['details'] = this.details;
    data['rejectReason'] = this.rejectReason;
    data['id'] = this.id;
    data['transactionCharge'] = this.transactionCharge;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
