import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_product/hr_dashboard_screen.dart';
import 'package:hr_product/signup_Screen.dart';

import 'forgotPassword_Screen.dart';

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {

  bool isCheck= false;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _validationLogin() {
    if (userController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter email");
      return false;
    }
    else if (passController.text.length < 6) {
      Fluttertoast.showToast(msg: "enter atleast 6 character");
      return false;
    }
    else {
      Fluttertoast.showToast(msg: "Login successful!");
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            bool isMobile = constraints.maxWidth <800;

            return SingleChildScrollView(
              child: Container(
                  width: screenWidth,
                  margin:  EdgeInsets.all(27),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: isMobile
                      ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(25),
                        height: 150,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/login.png'),

                          ),
                        ),
                      ),
                      _LoginForm(screenWidth,screenHeight),
                    ],
                  )
                      : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                        Container(
                          height: screenHeight*0.72,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/login.png')
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 80),
                            child: _LoginForm(screenWidth,screenHeight),
                          )),
                    ],
                  )
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _LoginForm(double screenwidth,double screenheight){
    return  Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 15,
              color: Colors.grey.withOpacity(0.7),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),

        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Text("Email Address",style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 3),
            Container(
              height: 42,
              child: TextFormField(
                controller: userController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "you@example.com",
                  hintStyle: TextStyle(color: Colors.grey,),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent
                      ,decorationColor: Colors.deepPurpleAccent,decoration: TextDecoration.underline)),
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              height: 42,
              child: TextFormField(
                controller: passController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Enter 6 character or more",
                  hintStyle: TextStyle(color: Colors.grey,),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),),
                ),
              ),
            ),
            SizedBox(height: 13),
            Row(children: [
              Checkbox(
                  value: isCheck,
                  onChanged: (value){
                    setState(() {
                      isCheck = !isCheck;
                    });
                  }),
              Text("Remember me"),
            ]),
            SizedBox(height: 14),
            SizedBox(
              height: 43,
              width: screenwidth,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),

                  onPressed: (){
                    if(_validationLogin()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HrDashboardScreen()));
                    }
                  },
                  child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Doesn't have an account yet?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(" Sign,Up",style: TextStyle(color: Colors.deepPurpleAccent,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,decorationColor: Colors.deepPurpleAccent)),
                ),
              ],
            ),
          ],
        )
    );

  }
}





