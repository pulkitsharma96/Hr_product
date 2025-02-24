import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hr_product/signup.dart';

class Loginform extends StatefulWidget {
  const Loginform({super.key});

  @override
  State<Loginform> createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
            builder: (context, constraints )
            {
              bool isMobile = constraints.maxWidth < 600;
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
                      Padding(padding: EdgeInsets.symmetric(vertical: 20),
                        child:
                        Image.asset('images/img_9.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      _buildLoginform(),
                    ],
                  )
                      : Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child:
                        Padding(padding: EdgeInsets.symmetric(vertical: 20),
                          child:
                          Image.asset('images/img_9.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: _buildLoginform()),
                    ],
                  ),

                ),
              );

            }
        ),
      ),
    );
  }
  Widget _buildLoginform(){
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Login "
              , style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26,
                  color: Colors.indigo[900]),
            ),

            SizedBox(height: 15,),

            Text("Email Address ",
              style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "you@example.com",
                  contentPadding: EdgeInsets.symmetric(horizontal: 4,
                      vertical: 3),
                  border: OutlineInputBorder(),
                ),
              ),
             ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [
                Text("Password", style: TextStyle(fontWeight: FontWeight
                    .bold),),

                Text("Forgot Password?",
                  style: TextStyle(color: Colors.purple,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.purple),)
              ],
            ),
            SizedBox(height: 10,),
            Form(child: TextFormField(decoration: InputDecoration(
              hintText: "Enter 6 character or more",
              contentPadding: EdgeInsets.symmetric(horizontal: 4,
                  vertical: 3),

              border: OutlineInputBorder(),
            ),),),
            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   Signup  ()),
                  );
                },

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),


                    backgroundColor: Colors.purple),

                child: Text("LOGIN", style: TextStyle(color: Colors
                    .white),),

              ),
            ),
            SizedBox( height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Don't have an account yet? ",
                  style: TextStyle(color: Colors.grey),),
                SizedBox(width: 6,),
                Text("Sign Up", style: TextStyle(color: Colors.purple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),)
              ],
            ),

          ],
        ),

      ),
    );
  }
}

