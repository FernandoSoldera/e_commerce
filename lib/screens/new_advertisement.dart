import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';

class NewAdvertisement extends StatefulWidget {
  @override
  _NewAdvertisementState createState() => _NewAdvertisementState();
}

class _NewAdvertisementState extends State<NewAdvertisement> {
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new_advertisement'.tr().toString()),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 52,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey[800],
                            size: 30,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'title'.tr().toString(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'price'.tr().toString(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'description'.tr().toString(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: 0.5,
                child: OutlineButton(
                  highlightColor: Colors.transparent,
                  highlightedBorderColor: Theme.of(context).primaryColor,
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => {},
                  child: Text('confirm_button'.tr().toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
