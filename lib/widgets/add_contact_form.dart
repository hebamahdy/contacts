import 'package:contacts/MyAppState.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/widgets/custom_button.dart';
import 'package:contacts/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactForm extends StatefulWidget {
  const AddContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
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
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              lastName = value;
            },
            hint: 'Last Name',
          ),
          const SizedBox(
            height: 16,
          ),

          CustomTextField(
            onSaved: (value) {
              mobile = value;
            },
            hint: 'Mobile',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Add Contact',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                appState.addNewContact(Contact(firstName!, lastName!, mobile!, email!,appState.getImage()));
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

