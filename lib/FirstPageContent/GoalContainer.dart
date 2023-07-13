import 'package:flutter/material.dart';

class GoalContainer extends StatelessWidget {
  GoalContainer(
      {required this.text1, required this.text2, required this.text3});
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: const BoxDecoration(
        color: Color(0XFF282C3F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/crown.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 22.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      color: Color(0XFF96979D),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                text3,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Goal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
