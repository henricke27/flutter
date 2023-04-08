import 'package:apps/supply.dart';
import 'package:flutter/material.dart';

import 'average.dart';
import 'bmi.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(
      key: UniqueKey(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APPS LIBRARY"),
        toolbarHeight: 64,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.local_gas_station_outlined,
                size: 32.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.medical_information_outlined,
                size: 32.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                size: 32.0,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SupplyApp(
            key: UniqueKey(),
          ),
          BMIApp(
            key: UniqueKey(),
          ),
          AverageApp(
            key: UniqueKey(),
          ),
        ],
      ),
    );
  }
}
