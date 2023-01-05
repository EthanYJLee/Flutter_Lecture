import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/dao/database_handler.dart';
import 'package:flutter_semi_project_app/model/photo_album.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewSelectedPhotos extends StatefulWidget {
  const ViewSelectedPhotos({super.key});

  @override
  State<ViewSelectedPhotos> createState() => _ViewSelectedPhotosState();
}

class _ViewSelectedPhotosState extends State<ViewSelectedPhotos>
    with WidgetsBindingObserver {
  late DatabaseHandler handler;
  late String pDate = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSelectedDate();
    handler = DatabaseHandler();
    handler.querySelectedPhotoAlbum(pDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 선택한 날짜 표시
        title: const Text(
          'Selected Photos',
        ),
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
      ),
      body: FutureBuilder(
        future: handler.querySelectedPhotoAlbum(pDate),
        builder:
            (BuildContext context, AsyncSnapshot<List<PhotoAlbum>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data?.length,
                itemBuilder: ((BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (() async {
                      PhotoAlbum photoAlbum = PhotoAlbum(
                        pTitle: '${snapshot.data?[index].pTitle}',
                        pContent: '${snapshot.data?[index].pContent}',
                        pPlace: '${snapshot.data?[index].pPlace}',
                        pImage: '${snapshot.data?[index].pImage}',
                        pDate: '${snapshot.data?[index].pDate}',
                        pGroup: int.parse(
                          '${snapshot.data?[index].pGroup}',
                        ),
                      );
                    }),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(15.0),
                          //   child: Text('${snapshot.data?[index].pDate}'),
                          // ),
                          Image.file(File('${snapshot.data?[index].pImage}')),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('${snapshot.data?[index].pTitle}'),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
          } else {
            return const Center(
                // child: CircularProgressIndicator(),
                );
          }
        },

        // ElevatedButton(
        //   onPressed: () {
        //     print(_dateTime);
        //     Navigator.pop(context);
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        //   ),
        //   child: const Text(
        //     '메인화면으로',
        //   ),
        // ),
      ),
    );
  }

  // ----- Functions -----

  // Desc: 달력에서 선택한 날짜 전달받기 (SharedPreferences)
  // 2022.12.25
  _getSelectedDate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pDate = prefs.getString('p_dateTimeString')!.substring(0, 10);
    });

    // select * from photoalbum where pDate = ? 에 들어갈 String
    // pDate = '$_dateTime'.substring(0, 10);
  }
}
