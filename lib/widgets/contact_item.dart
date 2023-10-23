import 'package:contacts/MyAppState.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact, required this.index});
  final Contact contact;
  final int index;


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color:kPrimaryColor,
            borderRadius:BorderRadius.circular(16)

          ),
          child: Center(child: Text(contact.firstName[0].toUpperCase(),style: TextStyle(color: Colors.white),),),
        ),
        Column(children: [
          Text(contact.firstName,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(contact.mobile)
        ],),
        IconButton(
          onPressed: () {

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
    );
  }
}