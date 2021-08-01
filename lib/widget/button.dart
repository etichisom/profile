import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/widget/text.dart';

Widget authbutton(String s,Function f,String key){
  return SizedBox(
    width: 250,
    height: 45,
    child: RaisedButton(
      key: ValueKey(key),
      onPressed: f,
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: wstext(s),),
    
  );
}
Widget Pbutton(){
  return ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder()
      ),
    child: Text('upgrade to pro'),);
}