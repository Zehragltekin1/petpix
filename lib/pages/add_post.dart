import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:petpix/pages/add_post3.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final List<Widget> _mediaList = [];
  final List<File> path = [];
  File? _file;
  int currentPage = 0;
  int? lastPage;

  Future<void> _fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> album =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      List<AssetEntity> media =
          await album[0].getAssetListPaged(page: currentPage, size: 60);

      for (var asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            _file = path[0];
          }
        }
      }
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
         FutureBuilder(
  future: asset.file,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      final File? file = snapshot.data as File?;
      final Widget imageWidget = file != null
          ? Image.file(
              file,
              fit: BoxFit.cover,
            )
          : Container(); // file null ise boş bir Container döner
      return Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: imageWidget,
            ),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(); // Veri yüklenirken dönüş yükleme animasyonu gösterilir.
    }
  },
)
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  if (_file != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPostTextScreen(_file!),
                    ));
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 375,
                  child: GridView.builder(
                    itemCount: _mediaList.isEmpty ? 0 : 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                      return _mediaList[indexx];
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Recent',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _mediaList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexx = index;
                          _file = path[index];
                        });
                      },
                      child: _mediaList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
