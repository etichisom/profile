import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String> pick()async{
  final ImagePicker _picker = ImagePicker();
  final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image.path;
}