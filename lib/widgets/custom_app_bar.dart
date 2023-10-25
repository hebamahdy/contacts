import 'package:contacts/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Padding(
          padding: const EdgeInsets.all(12),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child:  Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Text(title,style: const TextStyle(color: Colors.white),),
            ],
          )),
    ) ;

  }
}