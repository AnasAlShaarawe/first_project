import 'package:flutter/material.dart';

import 'secound_page.dart';

void main(){
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecoundPage(),
    );
  }
}
