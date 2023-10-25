import 'dart:io';

import 'package:contacts/MyAppState.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/screens/edit_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact, required this.index});
  final Contact contact;
  final int index;


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          contact.image==""?
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color:kPrimaryColor,
              borderRadius:BorderRadius.circular(24)

            ),
            child: Center(child: Text(contact.firstName[0].toUpperCase(),style: TextStyle(color: Colors.white),),),
          ):

          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.file(File(contact.image),fit: BoxFit.cover,),
            ),
          ),

          Column(children: [
            Text(contact.firstName,style: TextStyle(fontWeight: FontWeight.bold),),
            Text(contact.mobile)
          ],),
          IconButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return  EditContact(index: index);
                }),
              );

            },
            icon: const Icon(
              Icons.mode_edit,
              color: Colors.black,
              size: 30,
            ),
          ),
          IconButton(
           onPressed: (){
             appState.deleteContact(index);
           },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
