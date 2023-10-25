import 'package:contacts/contact.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier  {
  final List<Contact> _contacts = [];


    String _imagePath="";


  List<Contact> get contacts => _contacts;


  addNewContact(Contact contact)
  {

    contacts.add(contact);
    _imagePath="";
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
    contacts[index].image=_imagePath;
    _imagePath="";
    notifyListeners();

  }

  setImage(String imagePath)
  {
    _imagePath=imagePath;
    notifyListeners();
  }
 String getImage()
  {
    return _imagePath;
  }
}
