import 'package:contacts/contact.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier  {
  final List<Contact> _contacts = [];



  List<Contact> get contacts => _contacts;


  addNewContact(Contact contact)
  {
    contacts.add(contact);
    notifyListeners();
  }

  deleteContact(int index)
  {
    contacts.removeAt(index);
    notifyListeners();
  }

}
