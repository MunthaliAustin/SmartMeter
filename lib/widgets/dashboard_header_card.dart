import 'package:flutter/material.dart';
import 'package:smart_meter/widgets/greeting_slider.dart';
import 'package:smart_meter/widgets/balance_topup_bar.dart';
import '../config/app_colors.dart';

class DashboardHeaderCard extends StatelessWidget {
  final String username;
  final double balance;
  final VoidCallback onTopUp;

  const DashboardHeaderCard({
    Key? key,
    required this.username,
    required this.balance,
    required this.onTopUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.accentGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // If you want profile pic, icons, you can add Row here
          GreetingSlider(username: username),
          const SizedBox(height: 18),
          BalanceTopUpBar(balance: balance, onTopUp: onTopUp),
        ],
      ),
    );
  }
}