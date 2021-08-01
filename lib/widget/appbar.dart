import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/settings.dart';
import 'package:profile/service/authservice.dart';
import 'package:profile/theme.dart';

import 'back arrow.dart';

Widget appbar (BuildContext context,Ucontrol u){
  return  AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading:IconButton(icon: Icon(CupertinoIcons.moon_stars), onPressed: (){
    if(u.gettheme()==dark){
      u.settheme(light);
    }else{
      u.settheme(dark);
    }
    }),
    actions: [
      IconButton(icon: Icon(CupertinoIcons.settings), onPressed: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Setting()));
      })
    ],
  );
}
Widget appbar2 (BuildContext context, GlobalKey<ScaffoldState> key){
  return  AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading:back(context),
    actions: [
      IconButton(
        key: ValueKey('out'),
          icon: Icon(Icons.logout), onPressed: (){
        Authservice(key: key,context: context).logout();
      })
    ],

  );
}