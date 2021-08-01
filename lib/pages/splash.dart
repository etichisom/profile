import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/widget/text.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  BuildContext cu;
  Ucontrol ucontrol;
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  @override
  Widget build(BuildContext context) {
    ucontrol = Provider.of<Ucontrol>(context);
    cu = context;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btname('Welcome To Folt'),
              SizedBox(height: 40,),
              FadeTransition(
                opacity: animation,
                child:Image.asset('assests/login.png')
              ),
              SizedBox(height: 40,),
              Text('Loading data.........')
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    animation.dispose();
    super.dispose();

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = AnimationController(vsync: this, duration: Duration(seconds: 1),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.7).animate(animation);

    animation.addListener((){
      if(animation.isCompleted){
        animation.repeat();
      }else{
        animation.repeat();
      }
    });
    animation.repeat();

    check();
  }


   check()async {
     await Hive.openBox<User>('acct');
     await Hive.openBox<User>('log');
     Box<User> box = Hive.box<User>('log');
    Future.delayed(Duration(seconds: 4),(){
      if(box.get('u')!=null){
        use = box.get('u');
        ucontrol.setuser(use);
        Navigator.pushReplacement(cu, CupertinoPageRoute(builder: (context)=>Profile()));
      }else{
        Navigator.pushReplacement(cu, CupertinoPageRoute(builder: (context)=>Home()));
      }
    });

   }
}
