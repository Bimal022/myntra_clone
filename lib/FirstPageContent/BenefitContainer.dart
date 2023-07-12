import 'package:flutter/material.dart';

class BenefitsContainer extends StatelessWidget {
  const BenefitsContainer({
    required this.imagePath,
    required this.text,
  });
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset(imagePath),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
