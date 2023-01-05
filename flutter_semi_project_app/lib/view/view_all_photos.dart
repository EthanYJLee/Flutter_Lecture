import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/dao/database_handler.dart';
import 'package:flutter_semi_project_app/model/photo_album.dart';

class ViewAllPhotos extends StatefulWidget {
  const ViewAllPhotos({super.key});

  @override
  State<ViewAllPhotos> createState() => _ViewAllPhotosState();
}

class _ViewAllPhotosState extends State<ViewAllPhotos> {
  late DatabaseHandler handler = DatabaseHandler();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    // handler.initializeDB().whenComplete(() async {
    //   setState(() {});
    // });
    handler.queryPhotoalbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Photos',
        ),
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          future: handler.queryPhotoalbum(),
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
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('${snapshot.data?[index].pDate}'),
                            ),
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
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  // ----- Functions -----

}
