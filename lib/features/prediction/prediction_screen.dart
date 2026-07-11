import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PredictionScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const PredictionScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {




    final String prediction = result["prediction"];

    final double probability =
    (result["probability"] as num).toDouble();

    final double risk = probability / 100;

    final String riskLevel =
    prediction == "CKD" ? "High Risk" : "Low Risk";




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
              progressColor:
              prediction == "CKD"
                  ? Colors.red
                  : Colors.green,
              backgroundColor: Colors.grey.shade300,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  Text(
                  "${probability.toStringAsFixed(0)}%",
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
              backgroundColor:
              prediction == "CKD"
                  ? Colors.red.shade100
                  : Colors.green.shade100,
              avatar: Icon(
                Icons.warning,
                color:
                prediction == "CKD"
                    ? Colors.red
                    : Colors.green,
              ),
              label:  Text(
                riskLevel,
                style: TextStyle(
                  color:
                  prediction == "CKD"
                        ? Colors.red
                        : Colors.green,
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
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Row(
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

                    const SizedBox(height: 20),

                   Text(
                    prediction == "CKD"
                        ? "• Consult a nephrologist."
                        : "• Continue regular health checkups.",
                      ),

                    const SizedBox(height: 10),

                    const Text("• Repeat ACR test within 3 months."),

                    const SizedBox(height: 10),

                    const Text("• Improve blood sugar control."),

                    const SizedBox(height: 10),

                    const Text("• Monitor blood pressure regularly."),

                    const SizedBox(height: 10),

                    const Text("• Follow diabetic kidney disease guidelines."),
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