import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/model/user.dart';

Widget nco(String num,String title){
  return Column(
    children: [
      Text(num,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize:24 ),),
      SizedBox(height: 2,),
      Text(title,style: GoogleFonts.poppins(fontWeight:FontWeight.w600, ),),
    ],
  );
}

Widget nro(User user){
  return IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        nco(user.ranking, 'Ranking'),
        SizedBox(width: 6,),
        VerticalDivider(thickness: 2,),
        SizedBox(width: 6,),
        nco(user.followers.toString(), 'Followers'),
        SizedBox(width: 6,),
        VerticalDivider(thickness: 2,),
        SizedBox(width: 6,),
        nco(user.following.toString(), 'Following')
      ],
    ),
  );
}