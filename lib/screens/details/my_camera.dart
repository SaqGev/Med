import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MyCamera extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    _MyCamera();
  }


}

class _MyCamera extends State<MyCamera> {

  File imageFile;

  _openGallery () async{
    imageFile  = (await  ImagePicker.pickImage(source: ImageSource.gallery)) as File;
    this.setState(() {

    });
  }

  _openCamera() async{
    imageFile  = (await  ImagePicker.pickImage(source: ImageSource.camera)) as File;
    this.setState(() {

    });
  }

  Future<void> _showChoiceDialog( BuildContext context){
   return showDialog(context: context, builder: (BuildContext context){
     return AlertDialog(
       title: Text("Enter your choice!",
         style: TextStyle(
             color: kPrimarySecondColor
         ),
       ),
       content: SingleChildScrollView(
         child: ListBody(
          children: <Widget> [
            GestureDetector(
              child: Text("Gallery",
                style: TextStyle(
                    color: kPrimaryColor
                ),),
              onTap: (){
                _openGallery();
              },
            ),
            Padding(
                padding: EdgeInsets.all(8.0)
            ),
            GestureDetector(
              child: Text(
                  "Camera",
                  style: TextStyle(
                    color: kPrimaryColor
                  ),
              ),
              onTap: (){
                _openCamera();
              },
            ),
          ],
         ),
       ),
     );
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // iconTheme: IconThemeData(
        //   color: kBackgroundColor,
        // ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: kBackgroundColor,),
          onPressed:() => Scaffold.of(context).hasDrawer,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("No Image Selected!"),
            RaisedButton(onPressed: (){
              _showChoiceDialog(context);
            },
            child: Text("Select Image"),)
          ],
        ),
      ),
    );
  }
}