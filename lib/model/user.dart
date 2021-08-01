import 'package:hive/hive.dart';

part 'user.g.dart';
@HiveType(typeId : 2)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String about;
  @HiveField(3)
  int followers;
  @HiveField(4)
  String ranking;
  @HiveField(5)
  int following;
  @HiveField(6)
  String dp;
  @HiveField(7)
  String password;
  @HiveField(8)
  int number;
  @HiveField(9)
  String uid;

  User({this.name, this.email, this.about, this.followers, this.ranking,
      this.following, this.dp,this.password,this.number,this.uid});
}