import 'package:flutter/material.dart';
import 'package:smart_meter/widgets/greeting_slider.dart';
import 'package:smart_meter/widgets/balance_topup_bar.dart';
import '../config/app_colors.dart';

class DashboardHeaderCard extends StatelessWidget {
  final String username;
  final double balance;
  final VoidCallback onTopUp;
  final String selectedMeter;
  final List<String> meterNumbers;
  final ValueChanged<String?> onMeterChanged;
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;

  const DashboardHeaderCard({
    Key? key,
    required this.username,
    required this.balance,
    required this.onTopUp,
    required this.selectedMeter,
    required this.meterNumbers,
    required this.onMeterChanged,
    required this.onNotificationTap,
    required this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Height of header area (excluding floating bar)
    const double headerHeight = 180;
    // For placing bar overlap
    const double barOverlap = 50;

    return SizedBox(
      height: headerHeight + barOverlap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main header background
          Container(
            
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 70, 182, 120), AppColors.accentGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Meter selector + Notification + Profile
                Row(
                  children: [
                    // Meter selector
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.white.withOpacity(0.22), width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedMeter,
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                          items: meterNumbers.map((meter) {
                            return DropdownMenuItem(
                              value: meter,
                              child: Text(
                                meter,
                                style: const TextStyle(
                                  color: Color(0xFF2c3e50),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: onMeterChanged,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Notification Icon
                    InkWell(
                      onTap: onNotificationTap,
                      borderRadius: BorderRadius.circular(18),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.notifications_none, color: Colors.white, size: 26),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Profile Icon
                    InkWell(
                      onTap: onProfileTap,
                      borderRadius: BorderRadius.circular(18),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: AppColors.primaryGreen, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                // Greeting and sliding message
                GreetingSlider(username: username),
              ],
            ),
          ),
          // Floating Balance/Top Up Bar
          Positioned(
            bottom: -barOverlap,
            left: 0,
            right: 0,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.92,
                child: BalanceTopUpBar(balance: balance, onTopUp: onTopUp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}