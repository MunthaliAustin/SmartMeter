import 'dart:ui';
import 'package:flutter/material.dart';

class FloatingBottomTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FloatingBottomTabBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Tab data
    final tabs = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.more_horiz_rounded, 'label': 'More'},
    ];

    // Define the highlight color
    // const Color highlightColor = Color.fromARGB(255, 84, 172, 127);

    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 36,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.13),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 28,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: SizedBox(
              height: 68,
              child: Row(
                children: [
                  Expanded(
                    child: _TabBarItem(
                      icon: tabs[0]['icon'] as IconData,
                      label: tabs[0]['label'] as String,
                      selected: currentIndex == 0,
                      onTap: () => onTap(0),
                    ),
                  ),
                  // Divider
                  Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.27),
                      // Blur behind divider
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _TabBarItem(
                      icon: tabs[1]['icon'] as IconData,
                      label: tabs[1]['label'] as String,
                      selected: currentIndex == 1,
                      onTap: () => onTap(1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabBarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color highlightColor = Color(0xFF96CEB1);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: highlightColor.withOpacity(0.15),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          color: selected ? highlightColor.withOpacity(0.20) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 270),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              child: Icon(
                icon,
                key: ValueKey(selected),
                color: selected ? const Color.fromARGB(255, 62, 126, 93) : const Color.fromARGB(255, 97, 85, 85).withOpacity(0.77),
                size: selected ? 30 : 26,
                shadows: [
                  if (selected)
                    Shadow(
                      color: highlightColor.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 270),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? const Color.fromARGB(255, 67, 167, 115) : const Color.fromARGB(255, 78, 69, 69).withOpacity(0.7),
                fontSize: selected ? 16 : 14,
                letterSpacing: selected ? 0.2 : 0,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}