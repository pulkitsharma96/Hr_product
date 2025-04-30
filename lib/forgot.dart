import 'package:flutter/material.dart';
import 'package:hr_product/dashboard.dart';


import 'forgot.dart';

class Forgot  extends StatefulWidget {
  const Forgot ({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot  > {
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>  Dashboard ()),
              // );
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
