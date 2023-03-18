class User {
  late int? uSeq;
  late String? uId;
  late String? uPassword;
  late String? uNickname;

  User({this.uSeq, this.uId, this.uPassword, this.uNickname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uSeq: json['uSeq'],
      uId: json['uId'],
      uPassword: json['uPassword'],
      uNickname: json['uNickname'],
    );
  }
}
