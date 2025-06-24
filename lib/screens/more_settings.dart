import 'package:flutter/material.dart';

class MoreSettingsPage extends StatefulWidget {
  const MoreSettingsPage({super.key});

  @override
  State<MoreSettingsPage> createState() => _MoreSettingsPageState();
}

class _MoreSettingsPageState extends State<MoreSettingsPage> {
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    // Color palette
    const greenLight = Color(0xFF96ceb1); // #96ceb1
    const greenLighter = Color(0xFFeef4f0); // #eef4f0
    const green = Color(0xFF86c7a0); // #86c7a0
    const greenDark = Color(0xFF1a844a); // #1a844a
    const red = Color(0xFFd6222d); // #d6222d

    final sectionTitleStyle = TextStyle(
      color: greenLight,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      letterSpacing: 0.1,
    );
    final tileTextStyle = TextStyle(
      color: Colors.white.withOpacity(0.95),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    final tileIconColor = greenLight;
    final bgDark = const Color(0xFF181C1B); // custom dark background

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        backgroundColor: bgDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: greenLighter.withOpacity(0.11),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: green,
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: greenLight, size: 22),
                hintText: "Search",
                hintStyle: TextStyle(color: greenLight.withOpacity(0.8)),
                border: InputBorder.none,
              ),
            ),
          ),

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
          ),
          _SettingsTile(
            icon: Icons.shield_outlined,
            iconColor: tileIconColor,
            title: "Security",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            iconColor: tileIconColor,
            title: "Privacy & Security",
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.credit_card_outlined,
            iconColor: tileIconColor,
            title: "Billing & Subscription",
            onTap: () {},
            bottom: 18,
          ),

          // Personalization Section
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text("Personalization", style: sectionTitleStyle),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  value: _darkMode,
                  onChanged: (val) => setState(() => _darkMode = val),
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
                  icon: Icons.color_lens_outlined,
                  iconColor: tileIconColor,
                  title: "Appearance",
                  onTap: () {},
                  showDivider: true,
                  dense: true,
                ),
                _SettingsTile(
                  icon: Icons.language_rounded,
                  iconColor: tileIconColor,
                  title: "Language",
                  trailing: Text("English", style: TextStyle(color: greenLight, fontSize: 14)),
                  onTap: () {},
                  showDivider: true,
                  dense: true,
                ),
                _SettingsTile(
                  icon: Icons.grid_view_rounded,
                  iconColor: tileIconColor,
                  title: "Themes Organize",
                  onTap: () {},
                  dense: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Optional: Add a logout or delete account with red color
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            icon: const Icon(Icons.logout_rounded),
            label: const Text("Log out"),
            onPressed: () {},
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

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.trailing,
    this.onTap,
    this.showDivider = false,
    this.dense = false,
    this.bottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border(
      bottom: showDivider
          ? BorderSide(color: Colors.white.withOpacity(0.07), width: 1)
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
        title: Text(title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.95),
              fontSize: dense ? 15 : 16,
              fontWeight: FontWeight.w500,
            )),
        trailing: trailing ?? const Icon(Icons.chevron_right_rounded, color: Colors.white54),
        onTap: onTap,
      ),
    );
  }
}