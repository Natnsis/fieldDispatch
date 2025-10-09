import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🏷️ Title
              const Text(
                "Traffico",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 25),

              // 🚗 Cards Row
              Row(
                children: [
                  Expanded(
                    child: _DashboardCard(
                      color: Colors.blue.shade100,
                      icon: Icons.car_crash_sharp,
                      title: "Available Cars",
                      value: "120",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DashboardCard(
                      color: Colors.blue.shade50,
                      icon: Icons.traffic,
                      title: "Current Status",
                      value: "Crowded",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Alem Gena District",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // 🧱 Expanded form area
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: ReportForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🧩 Reusable dashboard card
class _DashboardCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;

  const _DashboardCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.blue.shade700),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13)),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 🧾 Report Form (stateful)
class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  double congestionLevel = 5;
  final TextEditingController incidentController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    incidentController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Congestion
        const Text(
          "Congestion Level",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Slider(
          value: congestionLevel,
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: Colors.blue.shade700,
          label: congestionLevel.round().toString(),
          onChanged: (value) {
            setState(() {
              congestionLevel = value;
            });
          },
        ),
        const SizedBox(height: 16),

        // Incident input
        TextField(
          controller: incidentController,
          decoration: InputDecoration(
            labelText: "Incident",
            hintText: "e.g., Accident near roundabout",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.warning_amber_rounded),
          ),
        ),
        const SizedBox(height: 16),

        // Notes
        TextField(
          controller: notesController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: "Notes (optional)",
            hintText: "Any additional observations...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.note_alt_rounded),
          ),
        ),
        const SizedBox(height: 24),

        // Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              final report = {
                "congestion_level": congestionLevel.round(),
                "incident": incidentController.text.trim(),
                "notes": notesController.text.trim(),
              };

              print(report);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Report submitted ✅")),
              );

              // Reset
              setState(() {
                congestionLevel = 5;
                incidentController.clear();
                notesController.clear();
              });
            },
            icon: const Icon(Icons.send_rounded),
            label: const Text("Submit Report", style: TextStyle(fontSize: 16)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: Colors.blue.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
