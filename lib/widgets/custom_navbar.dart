import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      
      backgroundColor: const Color(0xFF1E1E2C), 
      
      unselectedItemColor: Colors.white54, 
      
      selectedItemColor: Colors.blueAccent, 
      
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      
      elevation: 0,
      
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome),
          label: "Gemini",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: "Informasi",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "About",
        ),
      ],
    );
  }
}