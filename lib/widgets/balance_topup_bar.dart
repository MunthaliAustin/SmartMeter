import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class BalanceTopUpBar extends StatelessWidget {
  final double balance;
  final VoidCallback onTopUp;
  const BalanceTopUpBar({Key? key, required this.balance, required this.onTopUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet_rounded, color: AppColors.primaryGreen, size: 28),
          const SizedBox(width: 10),
          Text(
            "Balance",
            style: TextStyle(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "MWK ${balance.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            onPressed: onTopUp,
            child: const Text("+ Top Up"),
          ),
        ],
      ),
    );
  }
}