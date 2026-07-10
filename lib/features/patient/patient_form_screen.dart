import 'package:flutter/material.dart';

class PatientFormScreen extends StatelessWidget {
  const PatientFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Form"),
      ),
      body: const Center(
        child: Text(
          "Patient Form Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}