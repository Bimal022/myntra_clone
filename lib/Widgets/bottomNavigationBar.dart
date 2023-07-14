import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black, // Set the color of unselected items
      selectedItemColor:
          Color(0xFFff3f6c), // Set the color of the selected item
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/myntraLogo.png")),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage("assets/bottomNavigationBarIcons/Everyday.png")),
          label: 'Everyday',
        ),
        BottomNavigationBarItem(
          icon:
              ImageIcon(AssetImage("assets/bottomNavigationBarIcons/luxe.png")),
          label: 'Luxe',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage("assets/bottomNavigationBarIcons/profile.png")),
          label: 'Profile',
        ),
      ],
    );
  }
}
