import 'package:flutter/material.dart';

import 'forgot.dart';

class Signup   extends StatefulWidget {
  const Signup  ({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup  > {
  String _selectedItem = 'Select User Type' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(builder: (context, constraints){
          bool isMobile = constraints.maxWidth <  600;
          return SingleChildScrollView(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    Image.asset('images/img_11.png',
                      height: 200,
                      fit: BoxFit.cover,),
                    _buildSignup(),
                  ],
                )

                    :Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child:Padding(padding: EdgeInsets.symmetric(vertical:20),
                        child:
                        Image.asset('images/img_11.png',
                          height: 400,
                          fit: BoxFit.cover,),
                      ),
                    ),

                    Expanded(
                      flex:2,
                      child: _buildSignup(),
                    ),
                  ],
                )
            ),






          );
        }
        ),
      ),
    );

  }
  Widget _buildSignup(){
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      margin:EdgeInsets.all(15),
      child:Padding (padding: EdgeInsets.all(16),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text("SIGNUP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          //     SizedBox(height: 6,),
          //     Text("SELECT USER TYPE",          style: TextStyle(fontWeight: FontWeight.bold),),
          //
          //     SizedBox(height: 6,),
          // Form(child: DropdownButtonFormField<String>(
          //   value: _selectedItem,
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     contentPadding: EdgeInsets.symmetric(horizontal: 4,
          //         vertical: 3),
          //
          //   ),
          //   items: <String>['Select User Type','Male','Female','Others']
          //       .map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       _selectedItem = newValue!;
          //     });
          //   },
          // ),
          // ),
          //
          //   SizedBox(height: 6,),
          //     Text("FULL NAME",          style: TextStyle(fontWeight: FontWeight.bold),),
          //
          //     SizedBox(height: 6,),
          //     TextFormField(
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         hintText: "Enter  Your Name",
          //         contentPadding: EdgeInsets.symmetric(horizontal: 4,
          //             vertical: 3),
          //       ),
          //     ),
          //     SizedBox(height: 6,),
          //     Text("EMAIL ADDRESS ",
          //       style: TextStyle(fontWeight: FontWeight.bold),),
          //     SizedBox(height: 6,),
          //    TextFormField(
          //         decoration: InputDecoration(
          //           hintText: "you@example.com",
          //           contentPadding: EdgeInsets.symmetric(horizontal: 4,
          //               vertical: 3),
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     SizedBox(height: 6,),
          //     Text("PASSWORD",          style: TextStyle(fontWeight: FontWeight.bold),),
          //     SizedBox(height: 6,),
          //     TextFormField(decoration: InputDecoration(
          //       hintText: "Enter 6 character or more",
          //       contentPadding: EdgeInsets.symmetric(horizontal: 4,
          //           vertical: 3),
          //
          //       border: OutlineInputBorder(),
          //     ),),
          //     SizedBox(height: 6,),
          //     Text("CONFIRM PASSWORD",          style: TextStyle(fontWeight: FontWeight.bold),),
          //
          //     SizedBox(height: 6,),
          //     TextFormField(
          //       decoration: InputDecoration(
          //         hintText: "Re-enter password",
          //         contentPadding: EdgeInsets.symmetric(horizontal: 4,
          //             vertical: 3),
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //     SizedBox(height: 6,),
          //
          //
          //     ElevatedButton(onPressed: (){},
          //         style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //             ), minimumSize:
          //             Size(double.infinity, 50),),
          //
          //
          //
          //         child: Text("SIGNUP",style: TextStyle(color: Colors.white),)
          //     ),
          //
          //     SizedBox(height: 6,),
          //     Row(
          //       children: [
          //         Text("Already have an account?",style: TextStyle(color: Colors.grey),),
          //         SizedBox(width: 3,),
          //         Text("Login here",style: TextStyle(color: Colors.deepPurple,decoration: TextDecoration.underline),)
          //       ],
          //     )
          //   ],
          // ),
          children: [
            Column(
              children: [
                Text("Forgot",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold  ),),
                SizedBox(height: 5,width:5),

                Text("Password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold  ),),
              ],
            ),
            SizedBox(height:13),
            Text("Password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold  ),),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter 6 character or more",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
              ),
            ),
            SizedBox(height: 10,),
            Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.bold),),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password  must be same",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 3,vertical: 3),
              ),
            ),

            SizedBox(height:14,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   Forgot()),
              );
            },

              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                  minimumSize: Size(double.infinity, 40)),
              child: Text("Confirm",style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );


  }
}
