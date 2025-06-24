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
    // Implement your top up logic here
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
        const SizedBox(height: 50),
        // --- You can add more dashboard content here, e.g., usage stats, recent activity, etc. ---
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
              // Add your dashboard cards or list here...
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