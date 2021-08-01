import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/login.dart';
import 'package:profile/pages/signup.dart';
import 'package:profile/widget/text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(child: Container(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to Folt',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 28
                  ),),

                ],
              ),
              Expanded(child: Container(),),
              Expanded(
                flex: 10,
                  child: Container(child: Image.asset('assests/login.png',))),
              Expanded(child: Container(),),
              SizedBox(
                width: 250,
                height: 45,
                child: RaisedButton(onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>Login()));
                },
                  color: Colors.deepPurple,
                child: wstext('Log in'),),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 250,
                height: 45,
                child: OutlinedButton(
                  key: ValueKey('s'),
                  onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>Signup()));
                },
                  child: stext('Sign up'),),
              ),
             Expanded(child: Container(),)
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openbox();
  }

   openbox() async{
     //await Hive.openBox<User>('users');
   }
}
