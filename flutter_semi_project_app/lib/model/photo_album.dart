class PhotoAlbum {
  final int? pSeq;
  final String pTitle;
  final String pContent;
  final String pPlace;
  final String pImage;
  final String pDate;
  final int pGroup;

  PhotoAlbum(
      {this.pSeq,
      required this.pTitle,
      required this.pContent,
      required this.pPlace,
      required this.pImage,
      required this.pDate,
      required this.pGroup});

  PhotoAlbum.fromMap(Map<String, dynamic> res)
      : pSeq = res['pSeq'],
        pTitle = res['pTitle'],
        pContent = res['pContent'],
        pPlace = res['pPlace'],
        pImage = res['pImage'],
        pDate = res['pDate'],
        pGroup = res['pGroup'];

  Map<String, Object> toMap() {
    return {
      'pTitle': pTitle,
      'pContent': pContent,
      'pPlace': pPlace,
      'pImage': pImage,
      'pDate': pDate,
      'pGroup': pGroup
    };
  }
}
