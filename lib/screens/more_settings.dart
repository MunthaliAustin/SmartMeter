import 'package:flutter/material.dart';

class MoreSettingsPage extends StatefulWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const MoreSettingsPage({
    Key? key,
    required this.darkMode,
    required this.onDarkModeChanged,
  }) : super(key: key);

  @override
  State<MoreSettingsPage> createState() => _MoreSettingsPageState();
}

class _MoreSettingsPageState extends State<MoreSettingsPage> {
  @override
  Widget build(BuildContext context) {
    // Consistent palette with dashboard
    const greenLight = Color(0xFF96ceb1); // #96ceb1
    // const greenLighter = Color(0xFFeef4f0); // #eef4f0
    const green = Color(0xFF86c7a0); // #86c7a0
    const greenDark = Color(0xFF1a844a); // #1a844a
    const red = Color(0xFFd6222d); // #d6222d

    final sectionTitleStyle = TextStyle(
      color: greenDark,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      letterSpacing: 0.1,
    );
    final tileTextStyle = TextStyle(
      color: greenDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    final tileIconColor = green;
    // final bgLight = greenLighter;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
        children: [
          // Account Section
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text("Account", style: sectionTitleStyle),
          ),
          _SettingsTile(
            icon: Icons.person_outline_rounded,
            iconColor: tileIconColor,
            title: "Profile & Accounts",
            onTap: () {},
            textStyle: tileTextStyle,
          ),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            iconColor: tileIconColor,
            title: "Privacy & Security",
            onTap: () {},
            textStyle: tileTextStyle,
          ),
          _SettingsTile(
            icon: Icons.credit_card_outlined,
            iconColor: tileIconColor,
            title: "Notifications",
            onTap: () {},
            textStyle: tileTextStyle,
            bottom: 18,
          ),
          // Personalization Section
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text("Personalization", style: sectionTitleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.04),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15), // <-- Added padding
            child: Column(
              children: [
                SwitchListTile(
                  value: widget.darkMode,
                  onChanged: widget.onDarkModeChanged,
                  title: Row(
                    children: [
                      Icon(Icons.nights_stay_rounded, color: green, size: 23),
                      const SizedBox(width: 12),
                      Text("Dark Mode", style: tileTextStyle),
                    ],
                  ),
                  activeColor: greenDark,
                  inactiveThumbColor: greenLight,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                ),
                _SettingsTile(
                  icon: Icons.language_rounded,
                  iconColor: tileIconColor,
                  title: "Language",
                  trailing: Text("English", style: TextStyle(color: green, fontSize: 14)),
                  onTap: () {},
                  showDivider: true,
                  dense: true,
                  textStyle: tileTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Center the logout button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text("Log out"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget? trailing;
  final bool showDivider;
  final bool dense;
  final VoidCallback? onTap;
  final double bottom;
  final TextStyle? textStyle;

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.trailing,
    this.onTap,
    this.showDivider = false,
    this.dense = false,
    this.bottom = 0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border(
      bottom: showDivider
          ? BorderSide(color: iconColor.withOpacity(0.12), width: 1)
          : BorderSide.none,
    );
    return Container(
      decoration: BoxDecoration(border: border),
      margin: EdgeInsets.only(bottom: bottom),
      child: ListTile(
        dense: dense,
        minLeadingWidth: 26,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Icon(icon, color: iconColor, size: 22),
        title: Text(title, style: textStyle),
        trailing: trailing ?? Icon(Icons.chevron_right_rounded, color: iconColor.withOpacity(0.55)),
        onTap: onTap,
      ),
    );
  }
}