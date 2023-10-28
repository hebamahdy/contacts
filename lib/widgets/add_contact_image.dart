import 'dart:io';

import 'package:contacts/MyAppState.dart';
import 'package:contacts/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactImage extends StatefulWidget {
  const AddContactImage({super.key});

  @override
  State<AddContactImage> createState() => _AddContactImageState();
}

class _AddContactImageState extends State<AddContactImage> {
  File? file;

  getImage(String source) async {
    //var appState = context.watch<MyAppState>();

    var appState = Provider.of<MyAppState>(context, listen: false);

    final ImagePicker picker = ImagePicker();

    final XFile? imageCamera = await picker.pickImage(
        source: source == "gallery" ? ImageSource.gallery : ImageSource.camera);
    // final XFile? photo=await picker.pickImage(source: ImageSource.camera);
    if (imageCamera != null) {
      setState(() {
        file = File(imageCamera.path);
        appState.setImage(imageCamera.path);
      });
    }

    /*try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      file = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getImage('gallery');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          file == null
              ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              : SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      file!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          await getImage('gallery');
                        },
                        child: const Text(
                          "Gallery Image",
                          style: TextStyle(color: kPrimaryColor),
                        )),
                    TextButton(
                      onPressed: () async {
                        await getImage('camera');
                      },
                      child: const Text("Camera Image",
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                    if(file!=null)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            file = null;
                          });
                        },
                        child: const Text("Delete"))
                  ],
                )
        ],
      ),
    );
  }
}
