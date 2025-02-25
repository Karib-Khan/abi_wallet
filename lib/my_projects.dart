import 'package:flutter/material.dart';
import 'base_scaffold.dart';
import 'single_project_screen.dart'; // Import for navigation (optional)

class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  // Dummy data for demonstration (replace with real data from backend later)
  final int totalInvestments = 1200; // Total invested amount in dollars for user's projects
  final int totalReturns = 1800; // Total returns in dollars for user's projects
  final int activeProjects = 4; // Number of active projects for the user
  final int completedProjects = 2; // Number of completed projects for the user
  final List<Map<String, dynamic>> userProjects = [
    {'name': 'Project 1', 'invested': '\$200', 'duration': '3 months', 'status': 'Active'},
    {'name': 'Project 2', 'invested': '\$300', 'duration': '6 months', 'status': 'Completed'},
    {'name': 'Project 3', 'invested': '\$150', 'duration': '4 months', 'status': 'Pending'},
  ];
  final List<Map<String, dynamic>> notifications = [
    {'message': 'New project available: Project 5', 'date': 'Feb 25, 2025'},
    {'message': 'Investment approved for Project 1', 'date': 'Feb 24, 2025'},
  ];

  // Method to build a summary card (for metrics)
  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 30,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Method to build a project item
  Widget _buildProjectItem(Map<String, dynamic> project) {
    // Determine status color based on status
    Color statusColor = Colors.green; // Default to green for "Active"
    if (project['status'] == 'Completed') {
      statusColor = Colors.grey;
    } else if (project['status'] == 'Pending') {
      statusColor = Colors.orange;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProjectScreen(
              projectName: project['name'],
              minInvestment: project['invested'], // Use invested amount as minInvestment for simplicity
              totalRevenue: '\$${double.parse(project['invested'].replaceAll('\$', '')) * 1.5}', // Sample calculation; adjust as needed
              duration: project['duration'],
              description: 'This is a brief description of ${project['name']}.', // Sample data; adjust as needed
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1), // Light background for status
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: statusColor, width: 1.0),
                    ),
                    child: Text(
                      project['status'],
                      style: TextStyle(
                        fontSize: 14,
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Invested: ${project['invested']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Duration: ${project['duration']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Optional: Add a small project image or icon (commented out for now)
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('lib/assets/imgs/project.png'),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Method to build a notification item
  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              notification['message'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            notification['date'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      initialIndex: 2, // My Projects corresponds to index 2 (assuming it replaces MyProjectsScreen)
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Title
            Text(
              'My Projects',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Key Metrics Grid
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: GridView.count(
                crossAxisCount: 2, // Two columns
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildSummaryCard('Total Investments', '\$$totalInvestments', Icons.attach_money),
                  _buildSummaryCard('Total Returns', '\$$totalReturns', Icons.trending_up),
                  _buildSummaryCard('Active Projects', '$activeProjects', Icons.check_circle),
                  _buildSummaryCard('Completed Projects', '$completedProjects', Icons.done_all),
                ],
              ),
            ),
            SizedBox(height: 20),

            // User Projects Section
            Text(
              'My Projects',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ...userProjects.map((project) => _buildProjectItem(project)).toList(),
            SizedBox(height: 20),

            // Notifications Section
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ...notifications.map((notification) => _buildNotificationItem(notification)).toList(),
            SizedBox(height: 20), // Add extra space for scrolling
          ],
        ),
      ),
    );
  }
}