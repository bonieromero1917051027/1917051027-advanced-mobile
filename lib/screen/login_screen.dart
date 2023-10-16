import 'package:flutter/material.dart';
import 'package:justduit/screen/list_post_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController phoneController = new TextEditingController();
  var isPhoneValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      errorText:
                          isPhoneValid ? null : "Phone number doesn't Valid"),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    isPhoneValid = phoneController.text.length >= 12;
                  });
                  if (isPhoneValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPostScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}