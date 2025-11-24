import 'package:flutter/material.dart';

class FitnessCalculatorPage extends StatefulWidget {
  @override
  _FitnessCalculatorPageState createState() => _FitnessCalculatorPageState();
}

class _FitnessCalculatorPageState extends State<FitnessCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text("GYMMATE FITNESS"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Workout",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),

            SizedBox(height: 15),

            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("Dropdown will be added later..."),
            ),

            SizedBox(height: 25),

            Text(
              "Enter minutes:",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Example: 20",
                prefixIcon: Icon(Icons.timer),
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Calculate Calories"),
              ),
            ),

            SizedBox(height: 40),

            Text(
              "Result:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),
            Text("Result will appear here..."),
          ],
        ),
      ),
    );
  }
}
