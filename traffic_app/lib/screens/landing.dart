import 'package:flutter/material.dart';
import 'package:traffic_app/screens/login.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Traffico",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(child: Image.asset("landing.png"))),
          Column(
            children: [
              Text(
                "Monitor And Manage Traffic",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Track your post in real-time, optimize routes, and ensure timely deliver vehicles from one simple dashboard with the help of Ai",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey[400],
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
