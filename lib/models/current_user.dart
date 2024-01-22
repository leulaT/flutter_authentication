//User requires access token
//for next time login after succesfully signed in
class CurrentUser {
  CurrentUser(
      {
      // required this.tokenType,
      required this.accessToken});

  // final String? tokenType;
  final String? accessToken;

  // final String userId;
  // final String phoneNumber;
  // final String userAvatar;
  // final String userEmail;
  // final String userName;

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      // tokenType: json["token_type"],
      accessToken: json["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        // "token_type": tokenType,
        "access_token": accessToken,
      };
}
