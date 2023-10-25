import 'package:contacts/constants.dart';
import 'package:contacts/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(

      body:  SingleChildScrollView(

        child: Column(
          children: [
            CustomAppBar(title: "About Us"),
            Padding(
                padding:  EdgeInsets.all(24),
                child: Text(aboutUs,style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}
