import 'package:contacts/constants.dart';
import 'package:contacts/screens/about_us.dart';
import 'package:contacts/screens/add_new_contact.dart';
import 'package:flutter/material.dart';

class NoContactsWidget extends StatelessWidget {
  const NoContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.list,size: 100,
          weight: 300,
          ),
          const Text("Your Contact List Is Empty",),
          const SizedBox(
            height: 10,
          ),
          TextButton(child: const Text('Add Contact',style: TextStyle(color: kPrimaryColor)),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AddNewContact();
              }),
            );
          },
          ),
          TextButton(child: const Text('About Us',style: TextStyle(color: kPrimaryColor)),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const AboutUs();
                }),
              );
            },
          ),

        ],
      ),
    );
  }
}
