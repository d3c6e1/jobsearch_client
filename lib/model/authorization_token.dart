class AuthorizationToken {
  AuthorizationToken.fromMap(Map<String, dynamic> map) {
    accessToken = map["access_token"];
    refreshToken = map["refresh_token"];

    if (map.containsKey("expires_in")) {
      expiresAt = new DateTime.now().add(new Duration(seconds: map["expires_in"]));
    } else if (map.containsKey("expiresAt")) {
      expiresAt = DateTime.parse(map["expiresAt"]);
    }
  }
  String accessToken;
  String refreshToken;
  DateTime expiresAt;

  String get authorizationHeaderValue => "Bearer $accessToken";

  bool get isExpired =>
      expiresAt.difference(new DateTime.now()).inSeconds < 0;

  Map<String, dynamic> asMap() =>
      {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "expiresAt": expiresAt.toIso8601String()
      };
}