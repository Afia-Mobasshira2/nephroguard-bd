import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy prediction (replace with ML result later)
    const double risk = 0.87;
    const String riskLevel = "High Risk";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction Result"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            
            // Patient Summary
            
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [

                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        "Patient #1025",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Prediction Report"),
                    ),

                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Age"),
                        Text("54 Years"),
                      ],
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gender"),
                        Text("Male"),
                      ],
                    ),

                    SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("HbA1c"),
                        Text("8.6%"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            
            // Risk Percentage
           
            CircularPercentIndicator(
              radius: 95,
              lineWidth: 14,
              animation: true,
              animationDuration: 1500,
              percent: risk,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.red,
              backgroundColor: Colors.grey.shade300,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Text(
                    "87%",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text("Risk"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Chip(
              backgroundColor: Colors.red.shade100,
              avatar: const Icon(
                Icons.warning,
                color: Colors.red,
              ),
              label: const Text(
                riskLevel,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            
            // AI Recommendation
           
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Icon(Icons.lightbulb),

                        SizedBox(width: 10),

                        Text(
                          "AI Recommendations",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text("• Consult a nephrologist."),

                    SizedBox(height: 10),

                    Text("• Repeat ACR test within 3 months."),

                    SizedBox(height: 10),

                    Text("• Improve blood sugar control."),

                    SizedBox(height: 10),

                    Text("• Monitor blood pressure regularly."),

                    SizedBox(height: 10),

                    Text("• Follow diabetic kidney disease guidelines."),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

           
            // Buttons
            

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content: Text("PDF report will be available in the final version."),
                  ),
                 );
                },

                icon: const Icon(Icons.download),

                label: const Text(
                  "Download Report",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.go('/patient');
                },

                icon: const Icon(Icons.refresh),

                label: const Text(
                  "Predict Another Patient",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton.icon(
                onPressed: () {
                  context.go('/dashboard');
                },

                icon: const Icon(Icons.home),

                label: const Text(
                  "Back to Dashboard",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}