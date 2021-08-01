import 'package:flutter/cupertino.dart';

Widget back(BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
      child: Icon(CupertinoIcons.back));
}