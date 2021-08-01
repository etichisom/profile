import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/widget/text.dart';

class passfield extends StatefulWidget {
  TextEditingController controller;
  String keys;

  passfield({this.controller,this.keys});

  @override
  _passfieldState createState() => _passfieldState();
}

class _passfieldState extends State<passfield> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(widget.key),
      controller: widget.controller,
      validator:  (v){
        if(v.length < 3){
          return 'password to short';
        }
      },
      obscureText: show,
      decoration: InputDecoration(
         suffixIcon:hide(),
        labelText: 'password'
      ),
    );
  }
  Widget hide() {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(show){
            show=false;
          }else{
            show = true;
          }
        });
      },
        child: show?Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash));
 }
}

Widget edittext(String label,TextEditingController controller,String key){
  return TextFormField(
    key: ValueKey(key),
    controller: controller,
    validator:  (v){
      if(v.length < 3){
        return '$label to short';
      }},
    decoration: InputDecoration(
        labelText: label
    ),
  );
}

Widget sfield(TextEditingController controller,int line,String t,TextInputType type,String invalue,){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      tedit(t),
      SizedBox(height: 10,),
      Container(
        child: TextFormField(
          keyboardType: type,
          controller:controller,
          maxLines: line,
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
      )
    ],
  );
}
