import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justduit/screen/root_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen(BuildContext context, {super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confController = TextEditingController();

  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPassValid = true;
  bool passMatch = true;

  void setValue(String name, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("email", email);
  }

  void redirect() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("name")) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => rootScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Sign Up Now and Unlock the Power of Justduit",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Full Name",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "*",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      errorText: isNameValid ? null : "Full Name Tidak Valid"),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      "Email Address",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "*",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      errorText: isEmailValid ? null : "Email Tidak Valid"),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "*",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      errorText: isPassValid ? null : "Password Tidak Valid"),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "*",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: confController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      errorText:
                          passMatch ? null : "Confirm Password tidak sama"),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () async {
                            setState(() {
                              isEmailValid =
                                  emailController.text.contains('@') &&
                                      emailController.text.isNotEmpty;
                              isNameValid = nameController.text.isNotEmpty;
                              isPassValid = passController.text.isNotEmpty;
                              passMatch =
                                  passController.text == confController.text &&
                                      confController.text.isNotEmpty &&
                                      isPassValid;
                            });

                            if (passMatch && isEmailValid && isNameValid) {
                              setValue(
                                  nameController.text, emailController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => rootScreen(),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Continue",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     },
                      //     child: Text("Sign In",
                      //         style: GoogleFonts.poppins(
                      //           color: Colors.grey,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w500,
                      //         )))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
