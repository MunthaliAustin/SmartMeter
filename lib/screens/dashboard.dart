import 'package:flutter/material.dart';
import 'package:smart_meter/widgets/dashboard_header_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _electricityBalance = 50.0;
  String _selectedMeter = "123456789";
  final List<String> _meterNumbers = ["123456789", "987654321"];

  void _onTopUp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Top Up clicked!")),
    );
  }

  void _onNotificationTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Notifications clicked!")),
    );
  }

  void _onProfileTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile clicked!")),
    );
  }

  void _onTransactionHistoryTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Transaction History clicked!")),
    );
    // Navigator.push(context, MaterialPageRoute(builder: (_) => TransactionHistoryPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DashboardHeaderCard(
          username: "Austin",
          balance: _electricityBalance,
          selectedMeter: _selectedMeter,
          meterNumbers: _meterNumbers,
          onTopUp: _onTopUp,
          onMeterChanged: (value) {
            if (value != null) setState(() => _selectedMeter = value);
          },
          onNotificationTap: _onNotificationTap,
          onProfileTap: _onProfileTap,
        ),
        const SizedBox(height: 70),
        // --- Transaction History Button (Professional & Attractive) ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onTransactionHistoryTap,
              style: ElevatedButton.styleFrom(
                elevation: 6,
                backgroundColor: const Color(0xFF1a844a),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: const Color(0xFF96ceb1).withOpacity(0.22),
                textStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 0.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Transaction History",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios_rounded, size: 19)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        // --- Recent Activity Section ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recent Activity",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                elevation: 2,
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.bolt, color: Color(0xFF86c7a0)),
                  title: const Text("Used 1.2 kWh today"),
                  subtitle: const Text("23 June 2025"),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                elevation: 2,
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: Color(0xFF96ceb1)),
                  title: const Text("Topped up MWK 10.00"),
                  subtitle: const Text("22 June 2025"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}