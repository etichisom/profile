import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:profile/controller/usercontroller.dart';
import 'package:profile/model/user.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/signup.dart';
import 'package:profile/pages/splash.dart';
import 'package:profile/theme.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Directory directory =await getTemporaryDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserAdapter());
  runApp(MyApp());



}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_)=>Ucontrol(dark),
      child: M()

    );

  }

}
class M extends StatefulWidget {
  @override
  _MState createState() => _MState();
}

class _MState extends State<M> {
  @override
  Widget build(BuildContext context) {
    Ucontrol c = Provider.of<Ucontrol>(context);
    return MaterialApp(
      theme: c.gettheme(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

