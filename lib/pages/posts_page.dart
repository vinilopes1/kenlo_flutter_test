import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kenlo_flutter_test/controllers/posts_controller.dart';
import 'package:kenlo_flutter_test/controllers/users_controller.dart';
import 'package:kenlo_flutter_test/pages/login_page.dart';
import 'package:kenlo_flutter_test/utils/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class PostsPage extends GetView<PostsController> {
  final controller = Get.put(PostsController());
  // final SharedPreferences prefs = await SharedPreferences.getInstance();


  Future<Null> logout(context) async {
   // prefs.setString('username', "");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kenlogram"),
        backgroundColor: HexColor.fromHex("#ff2f56"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 47, 86, 1)
              ),
              child: Image.network("https://media-exp1.licdn.com/dms/image/C4E0BAQE1Pxtf7O6Y2Q/company-logo_200_200/0/1639493571700?e=2147483647&v=beta&t=HuNc6z7gWo_goH94UgyJt-nUYPFtOvC4lnt1CYXc8lk"),
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: Obx((){
        if(controller.loading.value == true){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.postsList.length,
          itemBuilder: (context, index){
            return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E0BAQE1Pxtf7O6Y2Q/company-logo_200_200/0/1639493571700?e=2147483647&v=beta&t=HuNc6z7gWo_goH94UgyJt-nUYPFtOvC4lnt1CYXc8lk")
                  ),
                  title: Text(controller.postsList[index].user.toString()),
                  subtitle: Text(
                    controller.postsList[index].publicationHour,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network(controller.postsList[index].image),
                      SizedBox(height: 2.h,),
                      Text(
                        controller.postsList[index].title,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.heart),
                      SizedBox(width: 5.w,),
                      Icon(FontAwesomeIcons.comment),
                      SizedBox(width: 2.w,),
                      Text(controller.postsList[index].comments.toString(), 
                      style: TextStyle(fontSize: 10.sp, color: Colors.black),),
                      SizedBox(width: 3.w),
                      Icon(FontAwesomeIcons.shareAlt),
                    ],
                  ),
                ),
              ],
            ),
          );
        });

      })
    );
  }
}