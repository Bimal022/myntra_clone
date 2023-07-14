import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myntra_clone/FirstPageContent/BenefitContainer.dart';
import 'package:myntra_clone/FirstPageContent/GoalContainer.dart';

import '../FirstPageContent/AdsRow.dart';
import 'LoginPage.dart';

class InsiderPage extends StatelessWidget {
  InsiderPage({
    Key? key,
  }) : super(key: key);
  List<Map<String, String>> adsData = [
    {
      'imagePath': 'assets/ads/voucher.png',
      'description': 'Get Myntra Voucher Rs.500',
    },
    {
      'imagePath': 'assets/ads/levis.png',
      'description': 'Get Levi\'s Voucher worth Rs. 500',
    },
    {
      'imagePath': 'assets/ads/kbc.png',
      'description': 'Get SonyLiv Premium 1 Month\nSubscription',
    },
    {
      'imagePath': 'assets/ads/talkies.png',
      'description': 'Get Tokyo Talkies Voucher worth\nRs.400',
    },
    {
      'imagePath': 'assets/ads/flights.png',
      'description': 'Get FLAT 12% OFF on Flipkart Flight\nBookings',
    },
    // Add more items as needed
  ];
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      // Handle sign-out error
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1C23),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 380,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A1C23),
                        ),
                        child: Image.asset(
                          "assets/kiara.png",
                          width: double.infinity,
                        ),
                      ),
                      const Text(
                        "Become An INSIDER!",
                        style: TextStyle(
                          color: Color(0xFFedab37),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6, bottom: 10),
                        child: const Text(
                          "Join the Insider programmer and earn\nSupercoins with every purchase and much\nmore.Log in now!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFa4a4a8),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 18),
                        child: const Text(
                          "New Goal Criteria",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GoalContainer(
                        text1: "₹0",
                        text2: "You've Spent",
                        text3: "₹ 7000",
                      ),
                      Container(
                        height: 1,
                        color: const Color(0XFF3e4152),
                      ),
                      GoalContainer(
                        text1: "0/5",
                        text2: "Your Orders",
                        text3: "5",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Recent purchases will only reflect in the goal once the return window is over",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                          color: Color(0xFF7E818C),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 16),
                        child: const Text(
                          "Benefits Of Joining The Program",
                          style: TextStyle(
                            color: Color(0xFFedab37),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          BenefitsContainer(
                            imagePath: 'assets/clock.png',
                            text: "Early Access To The Sales",
                          ),
                          SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0XFF3e4152),
                              ),
                            ),
                          ),
                          BenefitsContainer(
                            imagePath: 'assets/trophy.png',
                            text: "Insider Exclusive Rewards &\nBenefits",
                          ),
                          SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0XFF3e4152),
                              ),
                            ),
                          ),
                          BenefitsContainer(
                            imagePath: 'assets/call.png',
                            text: "Priority Customer Support",
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 16),
                        child: const Text(
                          "How Does It Work",
                          style: TextStyle(
                            color: Color(0xFFedab37),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Text(
                        "Earn Supercoins with every purchase.\nYou can get upto 3 SuperCoins for every ₹100 spent",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA4A4A8),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 9, right: 9, left: 9, bottom: 18),
                        decoration: BoxDecoration(
                          color: const Color(0xff2e3042),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset('assets/progress.png'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3E4152),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 9, 16, 11),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              child: Image.asset("assets/arrow.png"),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Shop on Myntra to Upgrade your tier',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14, bottom: 16),
                        child: const Text(
                          'Regards',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFedab37),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Assistant-Bold',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: const Text(
                          "Use your SuperCoins to get exciting rewards",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA4A4A8),
                          ),
                        ),
                      ),
                      //Ads
                      Ads(adsData: adsData),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 16,
                                  child: Image.asset("assets/myntraLogo.png"),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Image.asset(
                                  "assets/insiderLogo.png",
                                  height: 16,
                                  width: 85,
                                ),
                              ],
                            ),
                            const Text(
                              "Fashion Advice | VIP Access | Extra Savings",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFA4A4A8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF282C3F),
                ),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        height: 40, // Adjust the height as desired
                        child: ElevatedButton(
                          onPressed: () {
                            signOut(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFff3f6c),
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('LOG IN'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'By enrolling you agree to',
                      style: TextStyle(
                        color: Color(0xFF94969F),
                        fontSize: 13,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Insider Terms & Conditions',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF3F6C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
