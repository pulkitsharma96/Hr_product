import 'package:flutter/material.dart';

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {

  bool isCheck= false;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
        bool isMobile = constraints.maxWidth <800;

        return SingleChildScrollView(
          child: Container(
            width: screenWidth,
              padding: EdgeInsets.all(36),
            margin:  EdgeInsets.only(left: 30,right: 30),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: isMobile
            ? Column(
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  height: 200,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/login.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _LoginForm(screenWidth,screenHeight),
              ],
            )
                : Row(
              children: [
                Expanded(
                  flex: 2,
                  child:
                  Container(
                    height: screenHeight*0.65,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      image: DecorationImage(image: AssetImage('assets/images/login.png')
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                    child: _LoginForm(screenWidth,screenHeight)),
              ],
            )
          ),
        );
        },
      ),
    );
  }

  Widget _LoginForm(double screenwidth,double screenheight){
    return  Container(
      height: screenheight*0.75,
        margin:  EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 15,
              color: Colors.grey.withOpacity(0.7),
            )
          ],
          borderRadius: BorderRadius.circular(6),
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
                    borderSide: BorderSide(color: Colors.grey,width: 2),),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent
                    ,decorationColor: Colors.deepPurpleAccent,decoration: TextDecoration.underline)),
              ],
            ),
            SizedBox(height: 3),
            Container(
              height: 42,
              child: TextFormField(
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
                    borderSide: BorderSide(color: Colors.grey,width: 2),),
                ),
              ),
            ),
            SizedBox(height: 13),
            Row(children: [
              Checkbox(
                  value: isCheck,
                  onChanged: (value){
                    setState(() {
                      isCheck = value?? true;
                    });
                  }),
              Text("Remember me"),
            ]),
            SizedBox(height: 14),
            SizedBox(
              width: screenwidth,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(vertical: 18),
                  ),

                  onPressed: (){
                    // if(_validationLogin()){
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => HomeScreen()));
                    // }
                  },
                  child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Doesn't have an account yet?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                Text(" Sign,Up",style: TextStyle(color: Colors.deepPurpleAccent,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,decorationColor: Colors.deepPurpleAccent)),
              ],
            ),
          ],
        )
    );

  }
}





