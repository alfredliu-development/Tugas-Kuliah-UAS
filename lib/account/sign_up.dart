import 'package:anime_detail/account/sign_in.dart';
import 'package:anime_detail/database_helper.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _keyValue = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/shizuku-chan_background.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(80, 0, 182, 237), Colors.white],

                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
          ),

          Center(
            child: Container(
              height: 500,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20
              ),

              margin: EdgeInsets.symmetric(
                horizontal: 20
              ),

              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(20),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Decol",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    SizedBox(height: 25),
                    Form(
                      key: _keyValue,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(
                                color: Colors.black54
                              ),
                          
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 252, 229, 111),
                                ),
                              ),
                          
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          
                            keyboardType: TextInputType.text,
                            validator: (value) => value == null || value.isEmpty ? "The username is Empty" : null,
                          ),

                          SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.black54
                              ),
                          
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 252, 229, 111),
                                ),
                              ),
                          
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "The email is Empty";
                              return !value.contains("@") || !value.contains(".com") ? "The email is invalid" : null;
                            },
                          ),
                
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.black54
                              ),
                          
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off
                                  ),
                          
                                  onPressed: () => setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  }),
                                ),
                          
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 252, 229, 111),
                                ),
                              ),
                          
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "The password is Empty";
                              return value.length < 6 ? "A password must be 6 character or more" : null;
                            },
                          ),

                          SizedBox(height: 20),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                color: Colors.black54
                              ),
                          
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off
                                  ),
                          
                                  onPressed: () => setState(() {
                                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                  }),
                                ),
                          
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 252, 229, 111),
                                ),
                              ),
                          
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) => value == null || value.isEmpty ? "The password is Empty" : null,
                          ),

                          SizedBox(height: 40),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 182, 237),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 50
                              ),

                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Opti"
                                ),
                              ),
                            ),

                            onPressed: () {
                              if (_keyValue.currentState!.validate()) {
                                doSignUp();
                              }
                            },
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(
                            fontFamily: "Opti",
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(width: 5),
                        TextButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: "Opti",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 182, 237),
                            ),
                          ),

                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },

                                transitionDuration: Duration(milliseconds: 800),
                              )
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void doSignUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("A password doesn't match"),
        ),
      );

      return;
    }

    await DatabaseHelper.instance.registerUser(
      _nameController.text,
      _emailController.text,
      _passwordController.text
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Sign Up Successful"),
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}