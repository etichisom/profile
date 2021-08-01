

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/widget/appbar.dart';
import 'package:profile/widget/avater.dart';
import 'package:profile/widget/back%20arrow.dart';
import 'package:profile/widget/button.dart';
import 'package:profile/widget/contact.dart';
import 'package:profile/widget/numberwid.dart';
import 'package:profile/widget/text.dart';
import 'package:provider/provider.dart';
User use ;
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Ucontrol ucontrol;
  User u;
  @override
  Widget build(BuildContext context) {
    ucontrol = Provider.of<Ucontrol>(context);
    u=ucontrol.getuser();
    return Scaffold(
      appBar:appbar(context,ucontrol),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView( 
              physics: BouncingScrollPhysics(),
              children: [
               SizedBox(height: 10,),
               dp(u.dp),
                SizedBox(height: 15,),
                Column(
                  children: [
                    tname(u.name),
                    SizedBox(height: 4,),
                    tgmail(u.email),
                    SizedBox(height: 20,),
                    Pbutton(),
                    SizedBox(height: 15,),
                    nro(u),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tname('About'),
                    SizedBox(height: 10,),
                    tabout(u.about),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                contact(u),
             ],
            ),
          )),
    );
  }

}
