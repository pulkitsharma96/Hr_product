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

    //   body: Container(
    //     margin: EdgeInsets.fromLTRB(90, 50, 90, 50),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(4),
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.2),
    //           spreadRadius: 10,
    //           blurRadius: 2,
    //           offset: Offset(5, 0)
    //         ),
    //       ],
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Expanded(
    //           child: Container(
    //
    //             child: Image.asset('assets/images/login.png'),
    //           ),
    //         ),
    //         // Expanded(
    //         //   child: Container(
    //         //      margin:  EdgeInsets.fromLTRB(55,25,120,25),
    //         //    padding: EdgeInsets.fromLTRB(25,25,25,25),
    //         //     decoration: BoxDecoration(
    //         //       color: Colors.white,
    //         //       boxShadow: [
    //         //         BoxShadow(
    //         //           spreadRadius: 1,
    //         //           blurRadius: 15,
    //         //           color: Colors.grey.withOpacity(0.7),
    //         //         )
    //         //       ],
    //         //       borderRadius: BorderRadius.circular(6),
    //         //     ),
    //         //
    //         //     child: Column(
    //         //       mainAxisAlignment: MainAxisAlignment.start,
    //         //       crossAxisAlignment: CrossAxisAlignment.start,
    //         //       children: [
    //         //         Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    //         //         // Row(
    //         //         //   children: [
    //         //         //     Text("Doesn't have an account yet?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
    //         //         //     Text(" Sign,Up",style: TextStyle(color: Colors.deepPurpleAccent,
    //         //         //         decoration: TextDecoration.underline,
    //         //         //         fontWeight: FontWeight.bold,decorationColor: Colors.deepPurpleAccent)),
    //         //         //
    //         //         //   ],
    //         //         // ),
    //         //         SizedBox(height: 20),
    //         //         Text("Email Address",style: TextStyle(fontWeight: FontWeight.bold)),
    //         //         SizedBox(height: 3),
    //         //         Container(
    //         //           height: 42,
    //         //           child: TextFormField(
    //         //             cursorColor: Colors.grey,
    //         //             decoration: InputDecoration(
    //         //               hintText: "you@example.com",
    //         //               hintStyle: TextStyle(color: Colors.grey,),
    //         //               contentPadding: EdgeInsets.symmetric(horizontal: 16),
    //         //               border: OutlineInputBorder(
    //         //                 borderRadius: BorderRadius.circular(7),
    //         //                 borderSide: BorderSide(color: Colors.grey),
    //         //               ),
    //         //               focusedBorder: OutlineInputBorder(
    //         //                 borderSide: BorderSide(color: Colors.grey,width: 2),),
    //         //             ),
    //         //           ),
    //         //         ),
    //         //         SizedBox(height: 15,),
    //         //         Row(
    //         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //           children: [
    //         //             Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
    //         //             Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent
    //         //             ,decorationColor: Colors.deepPurpleAccent,decoration: TextDecoration.underline)),
    //         //           ],
    //         //         ),
    //         //         SizedBox(height: 3),
    //         //         Container(
    //         //           height: 42,
    //         //           child: TextFormField(
    //         //             cursorColor: Colors.grey,
    //         //             decoration: InputDecoration(
    //         //               hintText: "Enter 6 character or more",
    //         //               hintStyle: TextStyle(color: Colors.grey,),
    //         //               contentPadding: EdgeInsets.symmetric(horizontal: 16),
    //         //               border: OutlineInputBorder(
    //         //                 borderRadius: BorderRadius.circular(7),
    //         //                 borderSide: BorderSide(color: Colors.grey),
    //         //               ),
    //         //               focusedBorder: OutlineInputBorder(
    //         //                 borderSide: BorderSide(color: Colors.grey,width: 2),),
    //         //             ),
    //         //           ),
    //         //         ),
    //         //         SizedBox(height: 13),
    //         //         Row(children: [
    //         //           Checkbox(
    //         //               value: isCheck,
    //         //               onChanged: (value){
    //         //               setState(() {
    //         //               isCheck = value?? true;
    //         //             });
    //         //           }),
    //         //           Text("Remember me"),
    //         //         ]),
    //         //         SizedBox(height: 14),
    //         //         SizedBox(
    //         //           width: screenWidth,
    //         //           child: ElevatedButton(
    //         //               style: ElevatedButton.styleFrom(
    //         //                 shape: RoundedRectangleBorder(
    //         //                   borderRadius: BorderRadius.circular(7),
    //         //                 ),
    //         //                 backgroundColor: Colors.deepPurpleAccent,
    //         //                 padding: EdgeInsets.symmetric(vertical: 18),
    //         //               ),
    //         //
    //         //               onPressed: (){
    //         //                 // if(_validationLogin()){
    //         //                 //   Navigator.push(
    //         //                 //       context,
    //         //                 //       MaterialPageRoute(
    //         //                 //           builder: (context) => HomeScreen()));
    //         //                 // }
    //         //               },
    //         //               child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
    //         //         ),
    //         //         SizedBox(height: 10),
    //         //         Center(child: Text("Or Sign Up Using",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.grey),)),
    //         //         SizedBox(height: 10),
    //         //         Row(
    //         //           mainAxisAlignment: MainAxisAlignment.center,
    //         //           crossAxisAlignment: CrossAxisAlignment.center,
    //         //           children: [
    //         //             CircleAvatar(
    //         //               radius: 22,
    //         //               backgroundImage: AssetImage('assets/images/google.png'),
    //         //             ),
    //         //             SizedBox(width: 5),
    //         //             CircleAvatar(
    //         //               radius: 22,
    //         //               backgroundImage: AssetImage('assets/images/github.png'),
    //         //             ),
    //         //             SizedBox(width: 5),
    //         //             CircleAvatar(
    //         //               radius: 22,
    //         //               backgroundImage: AssetImage('assets/images/linkedin.png'),
    //         //             )
    //         //           ],
    //         //         )
    //         //       ],
    //         //     )
    //         //   ),
    //         // ),
    //       ]
    //
    //     ),
    //   ),
    // );
    body: Container(
      height: 900,
        width: 600,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login.png')
          ),
        ),
    ),
    );
  }
}
