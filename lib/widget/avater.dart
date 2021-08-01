import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget avater(String path){
  return Container(
    height: 100,
      width: 100,
    child: Center(
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
          ),
          CircleAvatar(
            radius: 45,
            backgroundImage: path==null?null:FileImage(File(path)),
            backgroundColor: Colors.grey[300],
            child: path==null?Icon(Icons.person_outline_rounded,size:50,color: Colors.white,):null,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Icon(CupertinoIcons.camera_fill,color: Colors.white,size: 12,),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget dp(String path){
  if(path != null){
 return Container(
    height: 128,
    width: 128,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image:path==null?null:FileImage(File(path),),
        fit: BoxFit.scaleDown
      )
    ),
  );
  }else{
    return  Container(
      height: 128,
      width: 128,
      decoration: BoxDecoration(
        color: Colors.grey[300],
          shape: BoxShape.circle,
      ),
      child:Center(child: Icon(Icons.person_outline_rounded,size:50,color: Colors.white,)) ,
    );
  }

}