class Wallet {
  final String id;
  final String walletType;
  final String accountNumber;
  final String userId;
  final String userType;
  final String balance;
  final String status;
  final String createdAt;
  final String updatedAt;

  Wallet({
    required this.id,
    required this.walletType,
    required this.accountNumber,
    required this.userId,
    required this.userType,
    required this.balance,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      walletType: json['walletType'],
      accountNumber: json['accountNumber'],
      userId: json['userId'],
      userType: json['userType'],
      balance: json['balance'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class User {
  final String id;
  final String phoneNumber;
  final String name;

  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
    );
  }
}

class AccountDetailss {
  final bool success;
  final String message;
  final Wallet wallet;
  final User user;

  AccountDetailss({
    required this.success,
    required this.message,
    required this.wallet,
    required this.user,
  });

  factory AccountDetailss.fromJson(Map<String, dynamic> json) {
    return AccountDetailss(
      success: json['success'],
      message: json['message'],
      wallet: Wallet.fromJson(json['data']['wallet']),
      user: User.fromJson(json['data']['user']),
    );
  }
}
