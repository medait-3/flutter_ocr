// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Recogscreen extends StatefulWidget {
  const Recogscreen({Key? key}) : super(key: key);

  @override
  State<Recogscreen> createState() => _RecogscreenState();
}

class _RecogscreenState extends State<Recogscreen> {
  late File pickedimage;
  optionsdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.gallery),
              child: Text("gallery"),
            ),
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.camera),
              child: Text("camera"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("cancel"),
            ),
          ],
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedimage != null) {
        pickedimage = File(image!.path);
      } else {
        print('noimage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.copy, size: 26),
            heroTag: null,
          ),
          SizedBox(
            width: 3,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.replay, size: 26),
            heroTag: null,
            backgroundColor: Colors.amberAccent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Text(
                "text recog",
                style: TextStyle(
                    fontSize: 33,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 33,
              ),
              InkWell(
                onTap: (() => optionsdialog(context)),
                child: Image(
                  fit: BoxFit.fill,
                  height: 255,
                  width: 255,
                  image: pickedimage == null ? AssetImage('assets/i.jpg'):FileImage(pickedimage),
                 
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Text(
                "lorem",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.amberAccent.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
