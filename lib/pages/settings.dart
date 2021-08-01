import 'package:flutter/material.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/service/pickimage.dart';
import 'package:profile/service/updateservices.dart';
import 'package:profile/widget/appbar.dart';
import 'package:profile/widget/avater.dart';
import 'package:profile/widget/button.dart';
import 'package:profile/widget/edittext.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String path ;
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  User use;
  final sck = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Ucontrol ucontrol = Provider.of<Ucontrol>(context);
    use=ucontrol.getuser();
    return Scaffold(
      key: sck,
      appBar: appbar2(context,sck),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child:use==null?SizedBox():ListView(
          physics: BouncingScrollPhysics(),
          children: [
            InkWell(
                onTap: (){
                  pickimage();
                },
                child: avater(path)),
            SizedBox(height: 15,),
            sfield(email, 1, 'Email',TextInputType.emailAddress,use.email),
            SizedBox(height: 15,),
            sfield(phone, 1, 'Phone',TextInputType.number,use.number.toString()),
            SizedBox(height: 15,),
            sfield(name, 1, 'Name',TextInputType.text,use.name),
            SizedBox(height: 15,),
            sfield(about, 7, 'About',TextInputType.text,use.about),
            SizedBox(height: 15,),
            SizedBox(height: 10,),
            authbutton('Update', (){
              update(context, use,ucontrol);
            },'settings'),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

   pickimage()async{
     path = await pick();
     setState(() {});

   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){setcontrol();});

  }


   setcontrol() {
     path=use.dp;
    email.text =use.email;
    name.text = use.name;
    about.text = use.about;
    pass.text = use.password;
    phone.text = use.number.toString();
    setState(() {});
   }

   update(BuildContext context, User uu,Ucontrol ucontrol) {
    User nu = User(
      followers: 110,
      ranking: '2.1M',
      email:  email.text==null?use.password:email.text,
      password: pass.text==null?use.password:pass.text,
      name: name.text==null?use.password:name.text,
      following: 200,
      dp: path,
      number: int.parse(phone.text),
      about:  about.text==null?use.password:about.text,
      uid: use.uid

    );
    Update(context: context,currentuser: uu,newuser:nu,keys:sck,ucontrol:ucontrol ).update();
   }
}
