import 'package:flutter/material.dart';
import 'package:kenlo_flutter_test/pages/login_page.dart';
import 'package:kenlo_flutter_test/pages/sign_up_page.dart';
import 'package:kenlo_flutter_test/utils/hex_color.dart';
import 'package:sizer/sizer.dart';


class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#ecf1fa"),
      body: Container(
        height: 100.h,
        child: Column(
          children: [
            Container(
              height: 10.h,
            ),
            Container(
              height: 90.h,
              child: Column(
                children: [
                  Image.network("https://media-exp1.licdn.com/dms/image/C4E0BAQE1Pxtf7O6Y2Q/company-logo_200_200/0/1639493571700?e=2147483647&v=beta&t=HuNc6z7gWo_goH94UgyJt-nUYPFtOvC4lnt1CYXc8lk", height: 30.h,),
                  SizedBox(height: 4.h,),
                  Text("Bem Vindo(a)", style: TextStyle(fontSize: 15.sp, color: HexColor.fromHex("ff2f56")),),
                  SizedBox(height: 1.h,),
                  Text("Entre para continuar", style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500),),
                  SizedBox(height: 4.h,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage(),
                        )
                      );
                    },
                    child: Container(
                      width: 75.w,
                      height: 6.h,
                      child: Center(
                        child: Text("Já sou cadastrado(a)"),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor.fromHex("ff2f56"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text("Ou"),
                  SizedBox(height: 2.h,),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUpPage(),
                        )
                      );
                    },
                    child: Container(
                      width: 75.w,
                      height: 6.h,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Quero conhecer o Kenlogram")
                          ],
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 0.5, color: HexColor.fromHex("ff2f56")),
                      primary: HexColor.fromHex("ff2f56"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Desenvolvido por ", style: TextStyle(fontSize: 9.sp, color: Colors.black)),
                      Text("José Vinícius", style: TextStyle(fontSize: 9.sp, color: HexColor.fromHex("ff2f56"))),
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}