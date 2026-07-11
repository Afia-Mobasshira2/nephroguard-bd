import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nephro_guard_bd/services/api_service.dart';

class PatientFormScreen extends StatefulWidget {
  const PatientFormScreen({super.key});

  @override
  State<PatientFormScreen> createState() => _PatientFormScreenState();
}

class _PatientFormScreenState extends State<PatientFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final ageController = TextEditingController();
  final bmiController = TextEditingController();
  final diabetesController = TextEditingController();
  final bpController = TextEditingController();
  final sugarController = TextEditingController();
  final hba1cController = TextEditingController();
  final creatinineController = TextEditingController();
  final egfrController = TextEditingController();
  final microController = TextEditingController();
  final acrController = TextEditingController();

  String gender = "Male";
  String smoking = "No";
  String familyHistory = "No";
  String medication = "Oral";
  String hypertension = "No";

  @override
  void dispose() {
    ageController.dispose();
    bmiController.dispose();
    diabetesController.dispose();
    bpController.dispose();
    sugarController.dispose();
    hba1cController.dispose();
    creatinineController.dispose();
    egfrController.dispose();
    microController.dispose();
    acrController.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    String hint = "",
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  






Future<void> predictRisk() async {
  if (!_formKey.currentState!.validate()) return;

  try {
    final api = ApiService();

    final result = await api.predict(
      age: int.parse(ageController.text),
      bloodPressure: double.parse(bpController.text),
      bloodSugar: double.parse(sugarController.text),
      serumCreatinine: double.parse(creatinineController.text),
      hypertension: hypertension == "Yes",
    );

    if (!mounted) return;

    context.push(
        "/prediction",
        extra: {
          "prediction": result["prediction"],
          "probability": result["probability"],

          "age": ageController.text,
          "gender": gender,
          "bloodSugar": sugarController.text,
          "bloodPressure": bpController.text,
          "creatininine": creatinineController.text,
          "hba1c": hba1cController.text,
        },
      );


  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Prediction Failed\n$e"),
      ),
    );
  }
}












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Information"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                "Diabetic Nephropathy Prediction",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Enter the patient's clinical information.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 25),

              buildTextField(
                label: "Age",
                controller: ageController,
              ),

              buildDropdown(
                title: "Gender",
                value: gender,
                items: const [
                  "Male",
                  "Female",
                ],
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              buildTextField(
                label: "BMI",
                controller: bmiController,
              ),

              buildTextField(
                label: "Diabetes Duration (Years)",
                controller: diabetesController,
              ),

              buildTextField(
                label: "Blood Pressure",
                controller: bpController,
              ),

              buildTextField(
                label: "Blood Sugar",
                controller: sugarController,
              ),

              buildTextField(
                label: "HbA1c (%)",
                controller: hba1cController,
              ),

              buildTextField(
                label: "Serum Creatinine",
                controller: creatinineController,
              ),

              buildTextField(
                label: "eGFR",
                controller: egfrController,
              ),

              buildTextField(
                label: "Urine Microalbumin",
                controller: microController,
              ),

              buildTextField(
                label: "ACR",
                controller: acrController,
              ),

              buildDropdown(
                title: "Smoking",
                value: smoking,
                items: const [
                  "Yes",
                  "No",
                ],
                onChanged: (value) {
                  setState(() {
                    smoking = value!;
                  });
                },
              ),

              buildDropdown(
                title: "Family History",
                value: familyHistory,
                items: const [
                  "Yes",
                  "No",
                ],
                onChanged: (value) {
                  setState(() {
                    familyHistory = value!;
                  });
                },
              ),

              buildDropdown(
                title: "Medication",
                value: medication,
                items: const [
                  "Oral",
                  "Insulin",
                  "Both",
                ],
                onChanged: (value) {
                  setState(() {
                    medication = value!;
                  });
                },
              ),

              buildDropdown(
                title: "Hypertension",
                value: hypertension,
                items: const [
                  "Yes",
                  "No",
                ],
                onChanged: (value) {
                  setState(() {
                    hypertension = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: predictRisk,
                  icon: const Icon(Icons.analytics),
                  label: const Text(
                    "Predict Risk",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}