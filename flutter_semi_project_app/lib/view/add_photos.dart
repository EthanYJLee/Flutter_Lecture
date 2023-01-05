import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/dao/database_handler.dart';
import 'package:flutter_semi_project_app/model/photo_album.dart';
import 'package:flutter_semi_project_app/view/image_upload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> with WidgetsBindingObserver {
  late DateTime _dateTime = DateTime.now();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController placeController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  String pTitle = '';
  String pContent = '';
  String pPlace = '';
  String pImage = '';
  String pDate = '';
  int pGroup = 0;

  // 추가한 이미지 가져오는 shared preferences
  late DatabaseHandler handler = DatabaseHandler();
  late List<String>? _imagePathList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSelectedDate();
    _imagePathList = [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Photos'),
          backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pDate,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: '제목을 입력하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  controller: placeController,
                  decoration: const InputDecoration(
                    labelText: '장소를 입력하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: '내용을 입력하세요',
                  ),
                ),
              ),
              // 이미지 선택한 후 이 페이지로 돌아오면 선택한 사진 list 띄워줘야 함.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 200,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const ImageUpload()),
                        ),
                      ).then((value) => _showSelectedImages());
                    },
                    child: const Text(
                      '사진 업로드',
                    ),
                  ),
                ],
              ),
              // 앨범날짜, 제목, 장소, 내용, 이미지경로 앨범 table에 insert
              ElevatedButton(
                onPressed: () {
                  pTitle = titleController.text;
                  pContent = contentController.text;
                  pPlace = placeController.text;
                  // datetime은 초단위까지 전부
                  pDate = '$_dateTime'.substring(0, 10);

                  // 이미지가 한 장일때와 여러 장일때 구분
                  if (_imagePathList!.length == 1) {
                    pImage = _imagePathList![0];

                    addPhotoalbum();
                  } else {
                    for (int i = 0; i < _imagePathList!.length; i++) {
                      pImage = _imagePathList![i];
                      addPhotoalbum();
                    }
                  }
                  print(pTitle);
                  print(pContent);
                  print(pPlace);
                  print(pDate);
                  print(pImage);
                  print(pGroup);

                  _showDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                ),
                child: const Text(
                  '앨범에 추가',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Desc: 달력에서 선택한 날짜 전달받기 (SharedPreferences)
  // 2022.12.27
  _getSelectedDate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pDate = prefs.getString('p_dateTimeString')!.substring(0, 10);
    });
  }

  Future _showSelectedImages() async {
    final prefs = await SharedPreferences.getInstance();
    _imagePathList = prefs.getStringList('p_imagePathList');
  }

  // Desc: photoalbum DB에 제목, 내용, 장소, 이미지경로, 날짜, 그룹 insert
  Future<int> addPhotoalbum() async {
    PhotoAlbum photoAlbum = PhotoAlbum(
      pTitle: pTitle,
      pContent: pContent,
      pPlace: pPlace,
      pImage: pImage,
      pDate: pDate,
      // 그룹 지정
      pGroup: pGroup,
    );
    await handler.insertPhotoalbum(photoAlbum);

    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('입력 결과'),
            content: const Text('입력이 완료되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text(
                  '완료',
                ),
              ),
            ],
          );
        });
  }
}
