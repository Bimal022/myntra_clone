import 'package:flutter/material.dart';

import 'InsiderPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPrefixFocused = false;
  final mobileNumberController = TextEditingController();

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(2),
          child: Column(
            children: [
              Image.asset(
                "assets/loginHeading.png",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, right: 36, left: 36),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'or',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isPrefixFocused ? Colors.black : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 11,
                                horizontal: 12,
                              ),
                              child: Text(
                                '+91 |',
                                style: TextStyle(
                                  color: isPrefixFocused
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: mobileNumberController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Mobile Number*',
                                  labelStyle: TextStyle(
                                    color: isPrefixFocused
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const textContainer(),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/insider');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFff3f6c),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Have trouble logging in?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF282C3F),
                            ),
                          ),
                          Text(
                            " Get help",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFff3c6f),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class textContainer extends StatelessWidget {
  const textContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 21, top: 21),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "By continuing, I agree to the ",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF282C3F),
                ),
              ),
              Text(
                "Terms of Use ",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFff3c6f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "&",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF282C3F),
                ),
              ),
              Text(
                " Privacy",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFff3c6f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Policy",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFff3c6f),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
