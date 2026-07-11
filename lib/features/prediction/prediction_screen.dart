import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PredictionScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const PredictionScreen({
    super.key,
    required this.result,
  });


  Widget buildInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


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
  child: Padding(
    padding: const EdgeInsets.all(18),
    child: Column(
      children: [

        const ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            "Patient Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Submitted Clinical Data"),
        ),

        const Divider(),

        buildInfo("Age", "${result["age"]} Years"),
        buildInfo("Gender", result["gender"]),
        buildInfo("Blood Sugar", "${result["bloodSugar"]} mg/dL"),
        buildInfo("Blood Pressure", "${result["bloodPressure"]} mmHg"),
        buildInfo("HbA1c", "${result["hba1c"]}%"),
        buildInfo("Creatinine", result["creatininine"]),

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

            const SizedBox(height: 20),

Card(
  color: prediction == "CKD"
      ? Colors.red.shade50
      : Colors.green.shade50,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [

        Icon(
          prediction == "CKD"
              ? Icons.warning_amber_rounded
              : Icons.check_circle,
          size: 60,
          color: prediction == "CKD"
              ? Colors.red
              : Colors.green,
        ),

        const SizedBox(height: 15),

        Text(
          prediction,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: prediction == "CKD"
                ? Colors.red
                : Colors.green,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Model Confidence",
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),

        Text(
          "${probability.toStringAsFixed(2)}%",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

                      if (prediction == "CKD") ...[
                      const Text("• Consult a nephrologist immediately."),
                      SizedBox(height: 10),
                      const Text("• Monitor kidney function regularly."),
                      SizedBox(height: 10),
                      const Text("• Improve blood sugar control."),
                      SizedBox(height: 10),
                      const Text("• Follow prescribed medication."),
                      SizedBox(height: 10),
                      const Text("• Reduce salt intake."),
                    ] else ...[
                      const Text("• Continue routine diabetes monitoring."),
                      SizedBox(height: 10),
                      const Text("• Maintain healthy blood sugar."),
                      SizedBox(height: 10),
                      const Text("• Check kidney function yearly."),
                      SizedBox(height: 10),
                      const Text("• Continue healthy lifestyle."),
                    ],
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