
import 'package:contacts/widgets/custom_app_bar.dart';
import 'package:contacts/widgets/edit_contact_form.dart';
import 'package:flutter/material.dart';

class EditContact extends StatelessWidget {
  const EditContact({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {



    return  Scaffold(

      body:  SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              const CustomAppBar(title: "Edit Contact"),
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: EditContactForm(index: index)),
            ],
          ),
        ),
      ),
    );
  }
}



