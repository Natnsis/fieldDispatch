import 'package:flutter/material.dart';
import 'package:traffic_app/screens/dashboard.dart';
import 'package:traffic_app/screens/profile.dart';
import 'package:traffic_app/screens/report.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const Material(
          color: Colors.grey,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.send)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),

        body: const TabBarView(children: [Dashboard(), Report(), Profile()]),
      ),
    );
  }
}
