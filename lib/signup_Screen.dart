import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_Srcreen.dart';
import 'login_Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isCheck= false;
  String userType = 'Select';
  List<String> selectUserType = ['Select','HR','Employee'];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  bool _validationSignUp() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter full name");
      return false;
    }
    else if (mailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter mail");
      return false;
    }
    else if (passController.text.length <6) {
      Fluttertoast.showToast(msg: "enter atleast 6 character in password");
      return false;
    }
    else if (passController.text != confirmController.text) {
      Fluttertoast.showToast(msg: "confirm password must be same as password");
      return false;
    }
    else {
      Fluttertoast.showToast(msg: "SignUp successful!");
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

            return Container(
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
                        image: DecorationImage(image: AssetImage('assets/images/signup.png'),
            
                        ),
                      ),
                    ),
                    Expanded(child: _SignUpForm(screenWidth,screenHeight)),
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
                          image: DecorationImage(image: AssetImage('assets/images/signup.png')
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 100, 20),
                          child: _SignUpForm(screenWidth,screenHeight),
                        )),
                  ],
                )
            );
          },
        ),
      ),
    );
  }

  Widget _SignUpForm(double screenwidth,double screenheight){
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
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SignUp",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text("User Type",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: userType,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  onChanged: (String? newValue){
                    setState(() {
                      userType = newValue!;
                    });
                  },
                  items: selectUserType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),);
                  }).toList(),),),
              SizedBox(height: 15,),
              Text("Full Name",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                child: TextFormField(
                  controller: nameController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              Text("Email Address",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                child: TextFormField(
                  controller: mailController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              Text("Phone Number",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              SizedBox(height: 15),
              Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                child: TextFormField(
                  controller: passController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              SizedBox(height: 15),
              Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Container(
                height: 42,
                child: TextFormField(
                  controller: confirmController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
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
              SizedBox(height: 24),
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
                      if(_validationSignUp()){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogIn_Screen()));
                    },
                    child: Text(" Login here",style: TextStyle(color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,decorationColor: Colors.deepPurpleAccent)),
                  ),
                ],
              ),
            ],
          ),
        )
    );

  }
}
