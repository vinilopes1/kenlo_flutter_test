import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kenlo_flutter_test/pages/posts_page.dart';
import 'package:kenlo_flutter_test/utils/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoggedIn = false;
  String name = '';

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userController.text);

    setState(() {
      name = userController.text;
      isLoggedIn = true;
    });

    userController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#ecf1fa"),
      body: SingleChildScrollView(
        child: Container(
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
                  Text("Entrar", style: TextStyle(fontSize: 15.sp, color: HexColor.fromHex("ff2f56")),),
                  SizedBox(height: 1.h,),
                  Text("Insira seu usuário e senha para entrar", style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500),),
                  SizedBox(height: 4.h,),
                  Container(
                    width: 82.w,
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: [
                        TextFormField(
                            controller: userController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              else if(text.length <= 3){
                                return 'Usuário possui no mínimo 4 letras';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              errorStyle: TextStyle(color: Colors.red),
                              prefixIcon: Container(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0)
                                      )
                                  ),
                                  child: Icon(FontAwesomeIcons.at, color: Colors.grey, size: 2.5.h,)),
                              hintText: "Usuário",
                              hintStyle: TextStyle(fontSize: 11.sp, color: Colors.grey.withOpacity(0.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            obscureText: false,
                          ),
                        SizedBox(height: 2.h,),
                        TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Campo obrigatório';
                              } else if(text.length <= 3){
                                return 'Senha possui no mínimo 4 letras';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              errorStyle: TextStyle(color: Colors.red),
                              prefixIcon: Container(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0)
                                      )
                                  ),
                                  child: Icon(FontAwesomeIcons.lock, color: Colors.grey, size: 3.h,)),
                              hintText: "Senha",
                              hintStyle: TextStyle(fontSize: 11.sp, color: Colors.grey.withOpacity(0.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                          ),
                      ],
                    ),
                    )
                  ),
                  SizedBox(height: 5.h,),
                  ElevatedButton(
                    onPressed: () {
                       if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(duration: Duration(seconds: 3),
                              content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 5.w,),
                                Text("Efetuando login...")
                              ],
                            ))
                        );
                        Future.delayed(const Duration(seconds: 3), () {
                            loginUser();  
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login realizado com sucesso.')));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => PostsPage(),
                              )
                            );
                          });
                        }
                      },
                    child: Container(
                      width: 75.w,
                      height: 6.h,
                      child: Center(
                        child: Text("Entrar"),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor.fromHex("ff2f56"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Voltar", style: TextStyle(fontSize: 10.sp, color: HexColor.fromHex("ff2f56")),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}