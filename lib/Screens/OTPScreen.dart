import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OtpScreen({required this.verificationId, required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithOTP(String smsCode) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(), // Navigate to MainScreen directly
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Verification Failed'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Verification code has been sent to ${widget.phoneNumber}'),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter OTP',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signInWithOTP(otpController.text);
              },
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
