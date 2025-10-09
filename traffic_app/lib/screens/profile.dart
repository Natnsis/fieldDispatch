import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🧍‍♂️ Profile Picture (popping effect)
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade200,
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 4),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://avatars.githubusercontent.com/u/9919?v=4",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🏷️ Name
              const Text(
                "Natnael Sisay",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2A78),
                ),
              ),

              const SizedBox(height: 30),

              // 🚪 Logout Button
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Logged out ✅")),
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                    shadowColor: Colors.blue.shade200,
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
