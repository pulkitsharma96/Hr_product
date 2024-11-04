import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final List<String> userTypeList = [
  'HR Super Admin',
  'Manager',
  'Employee',
  'HR',
];

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? selectedUserType;

  void _validateSignUp() {
    if (selectedUserType == null || selectedUserType!.isEmpty) {
      Fluttertoast.showToast(msg: "Please select a user type");
    } else if (_nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your full name");
    } else if (_emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter your email address");
    } else if (_passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter a password");
    } else if (_passwordController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be at least 6 characters");
    } else if (_confirmPasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please confirm your password");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(msg: "Passwords do not match");
    } else {
      Fluttertoast.showToast(msg: "Sign Up Successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 800;

            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: isMobile
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Image.asset(
                        'assets/Images/signup.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    _buildSignUpForm(),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset(
                          'assets/Images/signup.png',
                          height: 380,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildSignUpForm(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
     // margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SIGNUP',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "SELECT USER TYPE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 5.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select User Type",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              ),
              items: userTypeList.map((String userType) {
                return DropdownMenuItem<String>(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUserType = newValue;
                });
              },
              icon: const Icon(Icons.arrow_drop_down),
            ),
            const SizedBox(height: 15),
            const Text(
              "Full Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            TextField(

              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'you@example.com',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter 6 characters or more',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Confirm Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Re-enter password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _validateSignUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'SIGNUP',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.deepPurpleAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
