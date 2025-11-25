import 'package:flutter/material.dart';

class FitnessCalculatorPage extends StatefulWidget {
  @override
  _FitnessCalculatorPageState createState() => _FitnessCalculatorPageState();
}

class _FitnessCalculatorPageState extends State<FitnessCalculatorPage> {
  final TextEditingController minutesController = TextEditingController();

  final List<Map<String, dynamic>> workouts = [
    {"name": "Running", "cal": 12, "image": "assets/run.jpg"},
    {"name": "Walking", "cal": 4, "image": "assets/pushup.jpg"},
    {"name": "Cycling", "cal": 8, "image": "assets/cycle.jpg"},
  ];

  Map<String, dynamic>? selectedWorkout;
  String result = "";
  String dailyTip =
      "Stay hydrated — drink water before, during, and after exercise!";

  void calculate() {
    if (selectedWorkout == null) {
      showSnack("Please select a workout!");
      return;
    }

    if (minutesController.text.isEmpty ||
        int.tryParse(minutesController.text) == null) {
      showSnack("Enter valid minutes!");
      return;
    }

    int minutes = int.parse(minutesController.text);
    int total = (minutes * selectedWorkout!["cal"]).toInt();

    setState(() {
      result =
          "${selectedWorkout!["name"]} for $minutes minutes burns $total calories.";
    });
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  void dispose() {
    minutesController.dispose();
    super.dispose();
  }

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

            DropdownButton<Map<String, dynamic>>(
              value: selectedWorkout,
              hint: Text("Choose a workout"),
              isExpanded: true,
              items: workouts.map((w) {
                return DropdownMenuItem(
                  value: w,
                  child: Row(
                    children: [
                      Image.asset(w["image"], width: 35, height: 35),
                      SizedBox(width: 10),
                      Text(w["name"]),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedWorkout = val;
                });
              },
            ),

            SizedBox(height: 20),

            Text(
              "Enter minutes:",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            TextField(
              controller: minutesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Example: 20",
                prefixIcon: Icon(Icons.timer),
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: calculate,
                child: Text("Calculate Calories"),
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Result:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            Text(result, style: TextStyle(fontSize: 18)),

            SizedBox(height: 40),
            Text(
              "Daily Fitness Tip:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[900],
              ),
            ),

            SizedBox(height: 10),
            Text(
              dailyTip,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
