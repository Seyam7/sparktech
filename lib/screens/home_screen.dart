import 'package:flutter/material.dart';
import 'package:sparktech_flutter/widgets/bottomnavbar_widget.dart';
import 'package:sparktech_flutter/widgets/filter_widget.dart';
import 'package:sparktech_flutter/widgets/grid_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Learn Through Watching Reels',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FilterWidget(),
          SizedBox(height: 10),
          GridWidget(),
        ],
      ),
      bottomNavigationBar: BottomnavbarWidget(),
    );
  }
}
