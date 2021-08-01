import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/model/user.dart';
import 'package:profile/widget/text.dart';

Widget contact(User use){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      tname('contact'),
      SizedBox(height: 10,),
      ListTile(
        title: Text('email'),
        subtitle: Text(use.email),
        leading: Icon(CupertinoIcons.mail),
      ),
      ListTile(
        title: Text('Phone'),
        subtitle: Text(use.number.toString()),
        leading: Icon(CupertinoIcons.phone),
      )
    ],
  );
}