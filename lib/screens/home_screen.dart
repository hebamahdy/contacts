import 'package:contacts/MyAppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      drawer: Drawer(

        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset("name",fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(child: ListTile(
                    title:Text ("heba"),
                    subtitle: Text("heba mahdy.86@gmail.co"),

                  ))

                ],
              ),
              ListTile(title: Text("home page"),
              leading: Icon(Icons.home),
                onTap: (){},
              ),
              ListTile(title: Text("home page"),
                leading: Icon(Icons.account_balance_rounded),
                onTap: (){},
              ),
              ListTile(title: Text("home page"),
                leading: Icon(Icons.check_box),
                onTap: (){},
              ),
              ListTile(title: Text("home page"),
                leading: Icon(Icons.help),
                onTap: (){},
              ),
              ListTile(title: Text("home page"),
                leading: Icon(Icons.phone_android_outlined),
                onTap: (){},
              ),
              ListTile(title: Text("home page"),
                leading: Icon(Icons.exit_to_app),
                onTap: (){},
              ),
            ],
          ),
        ),

      ),
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Center(

              child: MaterialButton

                (
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){

                  scaffoldKey.currentState!.openDrawer();
              },child: Text("Open Drawer"),),
            )
          ],
        ),
      ),
    );
  }
}
