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

  editNewContact(int index,Contact contact)
  {
    contacts[index].firstName=contact.firstName;
    contacts[index].lastName=contact.lastName;

    contacts[index].mobile=contact.mobile;

    contacts[index].email=contact.email;

    notifyListeners();

  }

}
