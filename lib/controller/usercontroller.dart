import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/model/user.dart';

class Ucontrol extends ChangeNotifier{
    User _user;
   User get cuser => _user;
   ThemeData _themeData;


    Ucontrol(this._themeData);

  setuser(User u){
      _user = u;
      notifyListeners();
    }
    settheme(ThemeData data){
      _themeData =data;
      notifyListeners();
    }
    ThemeData gettheme(){
      return _themeData;
    }
    User getuser(){
      return _user;
    }

}