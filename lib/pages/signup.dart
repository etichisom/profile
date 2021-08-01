import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/service/authservice.dart';
import 'package:profile/service/pickimage.dart';
import 'package:profile/widget/avater.dart';
import 'package:profile/widget/back%20arrow.dart';
import 'package:profile/widget/button.dart';
import 'package:profile/widget/edittext.dart';
import 'package:profile/widget/text.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignState createState() =>  _SignState();
}

class _SignState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  bool show = true;
  final keys = GlobalKey<FormState>();
  final skeys =  GlobalKey<ScaffoldState>();
  String path;
  Ucontrol ucontrol;
  @override
  Widget build(BuildContext context) {
    ucontrol = Provider.of<Ucontrol>(context);
    return Scaffold(
      key: skeys,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Form(
              key: keys,
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Row(children: [back(context),]),
                  SizedBox(height: 25,),
                  htext('Sign up'),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      pickimage();
                    },
                      child: avater(path)),
                  SizedBox(height: 5,),
                  edittext('name', name,'name'),
                  SizedBox(height: 15,),
                  edittext('email', email,'email'),
                  SizedBox(height: 15,),
                  s(),
                  SizedBox(height: 30,),
                  authbutton('Sign up', (){
                    signup(context);
                  },'butt'),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      small("Already have an account ? "),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>Login()));
                        },
                          child: bsmall('Login')),
                    ],
                  )


                ],
              ),
            ),
          )),
    );
  }

   signup(BuildContext context) {
     if(keys.currentState.validate()){
       Authservice(
           key: skeys,
           context: context
       ).Signup(email.text, password.text,name.text,path,ucontrol);
     }

   }

   pickimage() async{
   path = await pick();
   setState(() {});
   print(path);
   }
  Widget hide() {
    return GestureDetector(
        onTap: (){
          setState(() {
            if(show){
              show=false;
            }else{
              show = true;
            }
          });
        },
        child: show?Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash));
  }
  Widget s(){
    return  TextFormField(
      key: ValueKey('password'),
      controller: password,
      validator:  (v){
        if(v.length < 3){
          return 'password to short';
        }
      },
      obscureText: show,
      decoration: InputDecoration(
          suffixIcon:hide(),
          labelText: 'password'
      ),
    );
  }

}

