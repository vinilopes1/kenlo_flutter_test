import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kenlo_flutter_test/pages/splash_page.dart';
import 'package:sizer/sizer.dart';

import 'pages/posts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kenlogram',
          theme: ThemeData.light(),
          home: SplashPage() ,
        );
      },
    );
  }
}
