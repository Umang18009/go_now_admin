import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now_admin/splash_screnn.dart';

import 'home_page.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hidePass=true;
  TextEditingController mobile =TextEditingController();
  TextEditingController password =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "GO NOW ADMIN",
              style: TextStyle(
                  color: Color(0xFFF8A400),
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Log In...",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "ADMIN NUMBER",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:  TextField(
                controller: mobile,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter your admin mobile number...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "ADMIN PASSWORD",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:  TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: hidePass,
                decoration: InputDecoration(
                    hintText: "Enter your admin password...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: InkWell(onTap: () {
                      setState(() {
                        hidePass?hidePass=false:hidePass=true;
                      });
                    },child:hidePass?const Icon(CupertinoIcons.eye_slash):const Icon(CupertinoIcons.eye) )),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: ElevatedButton(onPressed: () {
                if(mobile.text.toString()!="000"){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Invalid Admin Number"),)));
                }else if(password.text.toString()!="000"){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Invalid Admin Password"),)));
                }else{
                  SplashScreen.pref!.setBool('isHome',true);
                  Get.offAll(()=>const HomePage());
                }
              },style: ButtonStyle(
                  fixedSize: const MaterialStatePropertyAll(
                      Size.fromWidth(200)),
                  backgroundColor:
                  const MaterialStatePropertyAll(
                      Color(0xFFF8A400)),
                  shape: MaterialStatePropertyAll(
                      ContinuousRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20)))),child: const Text("Go to Admin Panel")),
            ),
          ],
        ),
      ),
    );
  }
  showLoader(){
    showDialog(barrierDismissible: false,context: context, builder: (context) {
      return Center(child: CircularProgressIndicator(),);
    },);
  }
  closeLoader(){Get.back();}
}

