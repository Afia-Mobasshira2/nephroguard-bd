import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> predictions = [
    {
      "patient": "Patient #1025",
      "date": "10 July 2026",
      "risk": "High",
      "percentage": 87,
      "color": Colors.red,
    },
    {
      "patient": "Patient #1026",
      "date": "09 July 2026",
      "risk": "Medium",
      "percentage": 58,
      "color": Colors.orange,
    },
    {
      "patient": "Patient #1027",
      "date": "08 July 2026",
      "risk": "Low",
      "percentage": 18,
      "color": Colors.green,
    },
    {
      "patient": "Patient #1028",
      "date": "07 July 2026",
      "risk": "High",
      "percentage": 92,
      "color": Colors.red,
    },
    {
      "patient": "Patient #1029",
      "date": "06 July 2026",
      "risk": "Medium",
      "percentage": 61,
      "color": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Patient ID...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: predictions.length,
                itemBuilder: (context, index) {

                  final item = predictions[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(item["patient"]),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                Text("Prediction Date: ${item["date"]}"),

                                const SizedBox(height: 10),

                                Text("Risk: ${item["risk"]}"),

                                const SizedBox(height: 10),

                                Text(
                                    "Probability: ${item["percentage"]}%"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context),
                                child: const Text("Close"),
                              )
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [

                            CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  item["color"].withOpacity(.15),
                              child: Icon(
                                Icons.person,
                                color: item["color"],
                              ),
                            ),

                            const SizedBox(width: 18),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    item["patient"],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.calendar_month,
                                        size: 16,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 5),

                                      Text(
                                        item["date"],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [

                                      Container(
                                        padding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: item["color"],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          item["risk"],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 12),

                                      Text(
                                        "${item["percentage"]}% Risk",
                                        style: TextStyle(
                                          color: item["color"],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}