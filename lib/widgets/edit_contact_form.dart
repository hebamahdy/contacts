import 'package:contacts/MyAppState.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/widgets/custom_button.dart';
import 'package:contacts/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditContactForm extends StatefulWidget {
  const EditContactForm({
    Key? key, required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  State<EditContactForm> createState() => _EditContactFormState();
}

class _EditContactFormState extends State<EditContactForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? firstName, lastName,mobile,email;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              firstName = value;
            },

            hint: 'First Name',
            initialValue: widget.contact.firstName,

          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              lastName = value;
            },
            hint: 'Last Name',
            initialValue: widget.contact.lastName,
          ),
          const SizedBox(
            height: 16,
          ),

          CustomTextField(
            onSaved: (value) {
              mobile = value;
            },
            hint: 'Mobile',
            initialValue: widget.contact.mobile,

          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
            initialValue: widget.contact.email,

          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                appState.addNewContact(Contact(firstName!, lastName!, mobile!, email!));
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

