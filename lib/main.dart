import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _result = '';

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    var height_data = height/100;
    double bmi = weight / (height_data * height_data);
    setState(() {
      _result = "Height: ${height.toStringAsFixed(2)} ""centimeter"
          "\nWeight: ${weight.toStringAsFixed(2)} kg"
          "\n\nBody Mass Index is ${bmi.toStringAsFixed(1)}\n\n";
      if (bmi < 18.6) {
        _result += 'underweight.';
      } else if (bmi >= 18.6 && bmi < 25.0) {
        _result += 'normal weight.';
      } else if (bmi >= 25.0 && bmi < 30.0) {
        _result += 'overweight.';
      } else if (bmi >= 30.0 && bmi <= 34.9) {
        _result += 'obese.';
      } else {
        _result += 'extremely obese.';
      }
    });
    heightController.clear();
    weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.height),
                      prefixIconColor: Colors.red,
                      hintText: "Enter height (in centimeters)",
                      labelText: "Height",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.line_weight),
                    prefixIconColor: Colors.red,
                    labelText: "Weight",
                    hintText: 'Enter weight (kg)',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: Text('Calculate BMI'),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      _result,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
