import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/utils/snack.dart';

class Update{
  BuildContext context;
  Box<User> box = Hive.box<User>('acct');
  Box<User> boxx = Hive.box<User>('log');
  User currentuser;
  User newuser;
  Ucontrol ucontrol;
  GlobalKey<ScaffoldState> keys;


  Update({ @required this.context,@required this.currentuser,@required this.newuser,@required this.keys,this.ucontrol});

  Widget update(){
    var contain = box.values.any((element) => element.email.trim() == currentuser.email.trim());

   box.put(currentuser.uid,newuser ).then((value){
     snack(keys, 'User has been updated');
     boxx.put('u', newuser);
     ucontrol.setuser(newuser);
     use=newuser;
   });

  }
}