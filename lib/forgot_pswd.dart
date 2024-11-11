import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_product/login_Screen.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  bool isCheck= false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  bool _validationForgotPassword() {
    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "enter atleast 6 character");
      return false;
    }
    else if (confirmpasswordController.text.length < 6) {
      Fluttertoast.showToast(msg: "passwords do not match ");
      return false;
    }
    else {
      Fluttertoast.showToast(msg: "Password change successfully!");
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
                  margin:  const EdgeInsets.all(27),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: isMobile
                      ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(25),
                        height: 150,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/forgot_image.jpg'),

                          ),
                        ),
                      ),
                      _ForgotPasswordForm(screenWidth,screenHeight),
                    ],
                  )
                      : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                        Container(
                          height: screenHeight*0.72,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/forgot_image.jpg')
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 80),
                            child: _ForgotPasswordForm(screenWidth,screenHeight),
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

  Widget _ForgotPasswordForm(double screenwidth,double screenheight){
    return  Container(
        padding: const EdgeInsets.all(18),
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
            const Text("Forgot Password?",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            const Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Container(
              height: 42,
              child: TextFormField(
                controller: passwordController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Enter 6 characters or more",
                  hintStyle: const TextStyle(color: Colors.grey,),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.grey),),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Container(
              height: 42,
              child: TextFormField(
                controller: confirmpasswordController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Password must be same",
                  hintStyle: const TextStyle(color: Colors.grey,),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: Colors.grey),),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 43,
              width: screenwidth,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),

                  onPressed: (){
                    if(_validationForgotPassword()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  },
                  child: const Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
            const SizedBox(height: 15),
          ],
        )
    );

  }
}





