import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:pocket_apteka/constants.dart';
import 'dart:developer' as developer;

import 'package:pocket_apteka/models/model.dart';

class addImage extends StatefulWidget {
  final ImageController controller;
  addImage({required this.controller});

  @override
  _addImageState createState() => _addImageState();
}

class _addImageState extends State<addImage> {
  @override
  initState() {
    image = getImage(widget.controller.image.toString());
  
}

  File? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future setImage(File? newImage) async {
    setState(() {
      image = newImage;
      widget.controller.setValue(image?.path);
    });
  }

  File? getImage(String imageSrc)  {
    if(imageSrc==null || imageSrc==""){
      return null;
    }
    return new File(imageSrc);
  }

  Future<dynamic> previewImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);

      if (pickedFile != null) {
        final _storeImage = File(pickedFile.path);

        final appDir = await getApplicationDocumentsDirectory();
        final fileName = Path.context.basename(pickedFile.path);

        final File localImage =
            await _storeImage.copy('${appDir.path}/$fileName');

        setImage(localImage);
      }
    } finally {
      return null;
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Пожалуйства,выберите изображение',
              style: TextStyle(color: kPrimaryColor),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      previewImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('Галерея'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      previewImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('Камера'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image == null
              ? ElevatedButton(
                  onPressed: () {
                    myAlert();
                  },
                  child: Text('Загрузить фото'),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              : Text(
                  "Фото не загружено",
                  style: TextStyle(fontSize: 20),
                )
        ],
      ),
    );
  }
}

class ImageController extends ChangeNotifier {
  String? image;
  ImageController({this.image = null});

  void setValue(String? value) {
    image = value;
    notifyListeners();
  }
}
