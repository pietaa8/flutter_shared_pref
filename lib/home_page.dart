import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  void incrementNumber() async {
    number++;

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("counter", number);

    print(number);

    setState(() {});
  }

  void loadNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    int count = pref.getInt("counter") ?? 0;

    number = count;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    loadNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementNumber,
        tooltip: "Add",
        child: const Icon(Icons.add),
      ),
    );
  }
}
