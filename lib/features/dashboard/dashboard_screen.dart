import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nephro_guard_bd/core/theme/app_colors.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("NephroGuard BD"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Dr. Afia",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),

                gradient: const LinearGradient(
                  colors: [
                    Color(0xff1565C0),
                    Color(0xff26A69A),
                  ],
                ),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.monitor_heart,
                    color: Colors.white,
                    size: 55,
                  ),

                  SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Diabetic Nephropathy Prediction",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Predict kidney disease risk using clinical data and AI.",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Statistics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.2,

              children: const [

                _StatCard(
                  title: "Patients",
                  value: "126",
                  icon: Icons.people,
                  color: Colors.blue,
                ),

                _StatCard(
                  title: "Predictions",
                  value: "84",
                  icon: Icons.analytics,
                  color: Colors.green,
                ),

                _StatCard(
                  title: "High Risk",
                  value: "19",
                  icon: Icons.warning,
                  color: Colors.orange,
                ),

                _StatCard(
                  title: "Reports",
                  value: "41",
                  icon: Icons.description,
                  color: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: _ActionCard(
                    title: "New Prediction",
                    icon: Icons.add_chart,
                    onTap: () {
                    context.go('/patient');
                    },
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _ActionCard(
                    title: "History",
                    icon: Icons.history,
                    onTap: () {
                    context.go('/history');
                            },
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _ActionCard(
                    title: "Profile",
                    icon: Icons.person,
                    onTap: () {
                    context.go('/profile');
                    }
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Recent Predictions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  child: const Icon(Icons.warning, color: Colors.red),
                ),
                title: const Text("Patient #1025"),
                subtitle: const Text("High Risk • 87%"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  child: const Icon(Icons.analytics, color: Colors.orange),
                ),
                title: const Text("Patient #1026"),
                subtitle: const Text("Medium Risk • 56%"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),

            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(Icons.check_circle, color: Colors.green),
                ),
                title: const Text("Patient #1027"),
                subtitle: const Text("Low Risk • 18%"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(Icons.analytics),
            label: "Predict",
          ),

          NavigationDestination(
            icon: Icon(Icons.history),
            label: "History",
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon, color: color, size: 36),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(title),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [

              Icon(
                icon,
                size: 34,
                color: AppColors.primary,
              ),

              const SizedBox(height: 10),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}