import 'package:flutter/material.dart';
import 'package:kenlo_flutter_test/pages/posts_page.dart';
import 'package:kenlo_flutter_test/pages/welcome_page.dart';
import 'package:kenlo_flutter_test/utils/hex_color.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
       Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomePage(),
      ),
      (route) => false,
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      color: HexColor.fromHex("#ffffff"),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 5.h, right: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                child: Image.network("https://media-exp1.licdn.com/dms/image/C4E0BAQE1Pxtf7O6Y2Q/company-logo_200_200/0/1639493571700?e=2147483647&v=beta&t=HuNc6z7gWo_goH94UgyJt-nUYPFtOvC4lnt1CYXc8lk"),
              ),
              Container(
                height: 15.h,
                child: Image.asset("assets/images/loading.gif"),
              )
              
            ],
          )
        ),
      ),
    );
  }
}