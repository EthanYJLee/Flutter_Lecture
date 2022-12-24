class User {
  final int? uSeq;
  final String uId;
  final String uPassword;

  User({this.uSeq, required this.uId, required this.uPassword});

  User.fromMap(Map<String, dynamic> res)
      : uSeq = res['uSeq'],
        uId = res['uId'],
        uPassword = res['uPassword'];

  Map<String, Object?> toMap() {
    return {'uSeq': uSeq, 'uId': uId, 'uPassword': uPassword};
  }
}
