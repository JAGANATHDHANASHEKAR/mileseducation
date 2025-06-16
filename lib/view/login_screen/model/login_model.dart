// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  LoginModel({
    required this.username,
    required this.password,
  });
  late final String username;
  late final String password;

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

class LoginResponse {
  LoginResponse({
    required this.userId,
    required this.username,
    required this.requirePasswordChange,
    required this.acctgPartyName,
    required this.acctgPartyId,
    required this.uomCurrency,
    required this.token,
    required this.expiry,
  });
  late final String userId;
  late final String username;
  late final String requirePasswordChange;
  late final String acctgPartyName;
  late final String acctgPartyId;
  late final String uomCurrency;
  late final String token;
  late final String expiry;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? "";
    username = json['username'] ?? "";
    requirePasswordChange = json['requirePasswordChange'] ?? "";
    acctgPartyName = json['acctgPartyName'] ?? "";
    acctgPartyId = json['acctgPartyId'] ?? "";
    uomCurrency = json['uomCurrency'] ?? "";
    token = json['token'] ?? "";
    expiry = json['expiry'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['requirePasswordChange'] = requirePasswordChange;
    data['acctgPartyName'] = acctgPartyName;
    data['acctgPartyId'] = acctgPartyId;
    data['uomCurrency'] = uomCurrency;
    data['token'] = token;
    data['expiry'] = expiry;
    return data;
  }

  @override
  String toString() {
    return 'LoginResponse(userId: $userId, username: $username, requirePasswordChange: $requirePasswordChange, acctgPartyName: $acctgPartyName, acctgPartyId: $acctgPartyId, uomCurrency: $uomCurrency, token: $token, expiry: $expiry)';
  }
}
