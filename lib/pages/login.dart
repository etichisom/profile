import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/pages/signup.dart';
import 'package:profile/service/authservice.dart';
import 'package:profile/widget/back%20arrow.dart';
import 'package:profile/widget/button.dart';
import 'package:profile/widget/edittext.dart';
import 'package:profile/widget/text.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final key = GlobalKey<FormState>();
  final skey =  GlobalKey<ScaffoldState>();
  Ucontrol ucontrol ;
  @override
  Widget build(BuildContext context) {
    ucontrol = Provider.of<Ucontrol>(context);
    return Scaffold(
      key: skey,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Form(
              key: key,
              child: ListView(
                physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 20,),
                Row(children: [back(context),]),
                SizedBox(height: 30,),
                htext('Login'),
                SizedBox(height: 15,),
                edittext('email', email,'lgmail'),
                SizedBox(height: 20,),
                passfield(controller: password,keys: 'lpass',),
                SizedBox(height: 50,),
                authbutton('Log in', (){
                  login(context);
                },'login'),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    small("Don't have an account ? "),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Signup()));
                      },
                        child: bsmall('sign up')),
                  ],
                )


               ],
      ),
            ),
          )),
    );
  }

   login(BuildContext context) {
    if(key.currentState.validate()){
     Authservice(
         key: skey,
         context: context
     ).login(email.text, password.text,ucontrol);
    }
   }
}
