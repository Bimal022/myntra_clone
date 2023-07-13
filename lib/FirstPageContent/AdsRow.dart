import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  final List<Map<String, String>> adsData;
  const Ads({
    required this.adsData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: adsData.length,
        itemBuilder: (context, index) {
          final imagePath = adsData[index]['imagePath']!;
          final description = adsData[index]['description']!;

          return Container(
            width: 280,
            margin: EdgeInsets.only(
              left: index != 0 ? 8 : 0,
              right: index == adsData.length - 1 ? 16 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xFFF6F2F7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF282C3F),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
