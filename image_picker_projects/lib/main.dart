import 'package:flutter/material.dart';
import 'package:image_picker_project/image_picker_web.dart';

void main() {
  runApp(MyApp());
}
 
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePickerWep(),
    );
  }
}

