import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myntra_clone/main.dart';
import 'OTPScreen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  var receivedID = '';
  Future<void> signInWithPhone(String phoneNumber, BuildContext context) async {
    setState(() {
      isLoading = true; // Set loading state to true
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MainScreen(), // Navigate to MainScreen directly
          ),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        setState(() {});
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    setState(() {
      isLoading = false; // Set loading state to false
    });
  }

  bool isPrefixFocused = false;
  final mobileNumberController = TextEditingController();

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
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
                              color:
                                  isPrefixFocused ? Colors.black : Colors.grey,
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
                        textContainer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.loaderOverlay.show();
                              String phoneNumber =
                                  '+91 ' + mobileNumberController.text.trim();
                              if (phoneNumber.isNotEmpty) {
                                signInWithPhone(phoneNumber, context);
                              } else {
                                // Show an error message or perform any necessary action for empty phone number
                                print("Phone number is empty.");
                              }
                              context.loaderOverlay.hide();
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
                        ),
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textContainer extends StatelessWidget {
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
