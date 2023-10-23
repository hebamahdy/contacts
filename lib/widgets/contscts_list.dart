import 'package:contacts/MyAppState.dart';
import 'package:contacts/contact.dart';
import 'package:contacts/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    List<Contact> contacts=appState.contacts;
    //contacts.add(Contact("Heba", "010000000000"));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: contacts.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ContactItem(
                contact:contacts [index],
                index: index,

              ),
            );
          }),
    );

  }
}
