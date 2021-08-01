import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/utils/loader.dart';
import 'package:profile/utils/snack.dart';

class Authservice{
  BuildContext context;
  GlobalKey<ScaffoldState> key;

  Authservice({this.context, this.key});
  Box<User> box = Hive.box<User>('acct');
  Box<User> boxx = Hive.box<User>('log');


   login(String email ,String password,Ucontrol u){
    loader(context).showloader();
    Future.delayed(Duration(seconds: 1),(){
      if(box.get(email.trim()) != null) {
        if(box.get(email.trim()).password == password.trim()){
          snack(key, 'success');
          u.setuser(box.get(email.trim()));
          loader(context).pop();
          boxx.put('u', box.get(email.trim()));
          Navigator.pushAndRemoveUntil(context,  CupertinoPageRoute(builder: (context)=>Profile()), (route) => false);
        }else{
          loader(context).pop();
          snack(key, 'invalid password');
        }
      }else{
        loader(context).pop();
        snack(key, 'user do not exist');

      }
    });

  }
  Signup(String email,String password,String name,String dp,Ucontrol user){
    loader(context).showloader();
    var uid = DateTime.now().microsecondsSinceEpoch;
    User u = User(
        followers: 110,
        ranking: '2.1M',
        email: email,
        password: password,
        name:name,
        following: 200,
        dp: dp,
        uid: email.trim(),
        number: 08103565207,
        about: "I do my best to find the right solutions to the problems that are posed to me. I adapt quickly and can show leadership and good communication skills. One of my goals is to become an expert contributing to the technological evolution of Africa.");
  Future.delayed(Duration(seconds: 1),(){
      var contain = box.values.any((element) => element.email == email);
      if(box.get(email.trim())==null){
        box.put(email.trim(),u);
        loader(context).pop();
        boxx.put('u', u);
        snack(key, 'user has been created');
        user.setuser(u);
        use=u;
        Navigator.pushAndRemoveUntil(context,  CupertinoPageRoute(builder: (context)=>Profile()), (route) => false);
      }else{
        loader(context).pop();
        snack(key, 'user already exist');
      }
      //box.add(u).then((value) => print('done'));
  });
  }
 logout(){
     boxx.clear();
     Navigator.pushAndRemoveUntil(context,  CupertinoPageRoute(builder: (context)=>Home()), (route) => false);
 }
}