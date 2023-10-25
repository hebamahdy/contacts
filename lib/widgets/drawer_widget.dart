import 'package:contacts/constants.dart';
import 'package:contacts/main.dart';
import 'package:contacts/screens/about_us.dart';
import 'package:contacts/screens/add_new_contact.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10) ,
      child: ListView(children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color:kPrimaryColor,
                  borderRadius:BorderRadius.circular(24)

              ),
              child:const Center(child: Text("C",style: TextStyle(color: Colors.white),),),
            ),
            const Expanded(child: ListTile(
              title:Text ("Contacts App"),
            ))

          ],
        ),
         ListTile(title: const Text("Home"),
          leading: const Icon(Icons.home),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const MyContactApp();
              }),
            );
          },
        ),
        ListTile(title: const Text("Add Contact"),
          leading: const Icon(Icons.add_circle_outline_outlined),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AddNewContact();
              }),
            );
          },
        ),
        ListTile(title: const Text("About Us"),
          leading: const Icon(Icons.info_outlined),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const AboutUs();
              }),
            );
          },
        ),
      ],)
      ,
    );
  }
}
