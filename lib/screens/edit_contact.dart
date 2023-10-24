import 'package:contacts/constants.dart';
import 'package:contacts/widgets/add_contact_form.dart';
import 'package:contacts/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EditContact extends StatelessWidget {
  const EditContact({super.key});

  @override
  Widget build(BuildContext context) {



    return const Scaffold(

      body:  SingleChildScrollView(

        child: Column(
          children: [
            CustomAppBar(title: "Add New Contact"),
            Padding(
                padding: EdgeInsets.all(24),
                child: AddContactForm()),
          ],
        ),
      ),
    );
  }
}



