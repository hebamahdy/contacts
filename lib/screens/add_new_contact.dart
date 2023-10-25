import 'package:contacts/widgets/add_contact_form.dart';
import 'package:contacts/widgets/add_contact_image.dart';
import 'package:contacts/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddNewContact extends StatelessWidget {
  const AddNewContact({super.key});

  @override
  Widget build(BuildContext context) {



    return const Scaffold(

      body:  SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              CustomAppBar(title: "Add New Contact"),
              Padding(
                padding: EdgeInsets.all(32),
                  child: Column(
                    children: [

                      AddContactImage(),
                     // SizedBox(height: 10,),
                      AddContactForm(),

                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



