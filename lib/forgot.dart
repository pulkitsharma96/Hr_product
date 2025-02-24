import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile= constraints.maxWidth < 300;
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: isMobile
                      ?
                  Column(
                    children: [
                      Image.asset('images/img_11.png',
                        fit: BoxFit.cover,
                        height: 200,

                      ),

                    ],
                  ):Row
                    (
                    children: [
                      Image.asset('images/img_11.png',
                        fit: BoxFit.cover,
                        height: 400,

                      ),
                    ],
                  ),
                ),

              );
            }

        ),
      ),
    );
  }

}




