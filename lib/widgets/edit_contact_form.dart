import 'dart:io';

import 'package:contacts/MyAppState.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/widgets/custom_button.dart';
import 'package:contacts/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditContactForm extends StatefulWidget {
  const EditContactForm({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<EditContactForm> createState() => _EditContactFormState();
}

class _EditContactFormState extends State<EditContactForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? firstName, lastName, mobile, email;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Contact contact = appState.contacts[widget.index];
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          ShowContactImage(index: widget.index),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              firstName = value;
            },
            hint: 'First Name',
            initialValue: contact.firstName,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              lastName = value;
            },
            hint: 'Last Name',
            initialValue: contact.lastName,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              mobile = value;
            },
            hint: 'Mobile',
            initialValue: contact.mobile,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
            initialValue: contact.email,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Edit Contact',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                appState.editNewContact(
                    widget.index,
                    Contact(firstName!, lastName!, mobile!, email!,
                        contact.image));
                Navigator.pop(context);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class ShowContactImage extends StatefulWidget {
  const ShowContactImage({super.key, required this.index});

  final int index;

  @override
  State<ShowContactImage> createState() => _ShowContactImageState();
}

class _ShowContactImageState extends State<ShowContactImage> {
  File? file;
  getImage() async {
    var appState = Provider.of<MyAppState>(context, listen: false);

    //var appState = context.watch<MyAppState>();

    final ImagePicker picker = ImagePicker();

    final XFile? imageCamera =
        await picker.pickImage(source: ImageSource.gallery);
    // final XFile? photo=await picker.pickImage(source: ImageSource.camera);
    if (imageCamera != null) {
      setState(() {
        file = File(imageCamera.path);
        appState.contacts[widget.index].image = imageCamera.path;
        print(
            "uploaded image ${appState.contacts[widget.index].image}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();
    var appState = Provider.of<MyAppState>(context, listen: false);

    Contact contact = appState.contacts[widget.index];
    print(
        "uploaded1 image ${appState.contacts[widget.index].image}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        contact.image != ""
            ? SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.file(
                    File(contact.image),
                    fit: BoxFit.cover,
                  ),
                ))
            : GestureDetector(
          onTap: () async{
            await getImage();
          },
              child: Container(
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
                ),
            ),
        TextButton(
            onPressed: () async {
              await getImage();
            },
            child: const Text(
              "Edit Contact Image",
              style: TextStyle(color: kPrimaryColor),
            ))
      ],
    );
  }
}
