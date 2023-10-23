import 'package:flutter/material.dart';

class NoContactsWidget extends StatelessWidget {
  const NoContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.list),
          Text("Your Contact List Is Empty"),
          Text("ADD CONTACT"),
        ],
      ),
    );
  }
}
