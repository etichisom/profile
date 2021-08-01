import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

snack( GlobalKey<ScaffoldState> key,String s){
  key.currentState.showSnackBar(SnackBar(content: Text(s)));
}