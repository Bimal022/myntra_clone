import 'package:flutter/material.dart';
import 'package:myntra_clone/FirstPageContent/BenefitContainer.dart';
import 'package:myntra_clone/FirstPageContent/GoalContainer.dart';

class InsiderPage extends StatelessWidget {
  const InsiderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1C23),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
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
                margin: const EdgeInsets.only(top: 6),
                child: const Text(
                  "Join the Insider programmer and earn\nSupercoins with every purchase and much\nmore.Log in now!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA4A4A8),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: const Text(
                  "New Goal Criteria",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GoalContainer(
                  text1: "₹0", text2: "You've Spent", text3: "₹ 7000"),
              Container(
                height: 1,
                color: const Color(0XFF3e4152),
              ),
              GoalContainer(text1: "0/5", text2: "Your Orders", text3: "5"),
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
              Column(
                children: [
                  const BenefitsContainer(
                      imagePath: 'assets/clock.png',
                      text: "Early Access To The Sales"),
                  Container(
                    height: 1,
                    color: const Color(0XFF3e4152),
                  ),
                  const BenefitsContainer(
                      imagePath: 'assets/trophy.png',
                      text: "Insider Exclusive Rewards &\nBenefits"),
                  Container(
                    height: 1,
                    color: const Color(0XFF3e4152),
                  ),
                  const BenefitsContainer(
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
              const Text(
                "Use your SuperCoins to get exciting rewards",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA4A4A8),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
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
                        SizedBox(
                          width: 7,
                        ),
                        Image.asset(
                          "assets/insiderLogo.png",
                          height: 16,
                          width: 85,
                        ),
                      ],
                    ),
                    Text(
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
    );
  }
}
