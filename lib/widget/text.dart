import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget stext(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 16),);
}
Widget wstext(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),);
}
Widget htext(String s){
  return Text(s,style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.w500,),);
}
Widget tname(String s){
  return Text(s,style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.bold,),);
}
Widget btname(String s){
  return Text(s,style: GoogleFonts.roboto(fontSize: 35,fontWeight: FontWeight.bold,),);
}
Widget tgmail(String s){
  return Text(s,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey),);
}
Widget about(String s){
  return Text(s,style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold,),);
}
Widget small(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 13,),);
}
Widget tedit(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600),);
}
Widget bsmall(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 13,color: Colors.blueAccent),);
}
Widget tabout(String s){
  return Text(s,style: GoogleFonts.poppins(fontSize: 15,),);
}