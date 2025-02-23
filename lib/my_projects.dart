import 'package:flutter/material.dart';
import 'base_scaffold.dart';
import 'single_project_screen.dart'; // Import the SingleProjectScreen

class MyProjectsScreen extends StatefulWidget {
  @override
  _MyProjectsScreenState createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  // Method to build each project item with status indicator
  Widget _buildMyProjectItem(String projectName, String investedAmount, String duration, String status) {
    // Determine status color based on status
    Color statusColor = Colors.green; // Default to green for "Active"
    if (status == 'Completed') {
      statusColor = Colors.grey;
    } else if (status == 'Pending') {
      statusColor = Colors.orange;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProjectScreen(
              projectName: projectName,
              minInvestment: '\$200', // Sample data; adjust as needed (based on invested amount)
              totalRevenue: '\$${double.parse(investedAmount.replaceAll('\$', '')) * 1.5}', // Sample calculation; adjust as needed
              duration: duration, // Use actual duration
              description: 'This is a brief description of $projectName.', // Sample data; adjust as needed
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Green strip on the left side
            Container(
              width: 5,
              height: 120, // Increased height to accommodate status
              color: Colors.green,
            ),
            SizedBox(width: 10),
            // Project details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectName,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
                        status,
                        style: TextStyle(
                          fontSize: 14,
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Invested: $investedAmount'),
                    Text('Duration: $duration'),
                  ],
                ),
              ),
            ),
            // Project image on the right
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/imgs/project.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a summary card (for Total Invested and Total Revenue)
  Widget _buildSummaryCard(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center, // Center the title horizontally
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center, // Center the value horizontally
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      initialIndex: 2, // Assuming My Projects is the third tab (index 2)
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid layout for Total Invested and Total Revenue
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2, // Two columns
                shrinkWrap: true, // Ensures the grid doesn’t take up unnecessary space
                physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling
                mainAxisSpacing: 16.0, // Vertical spacing between cards
                crossAxisSpacing: 16.0, // Horizontal spacing between cards
                children: [
                  _buildSummaryCard('Total Invested', '\$1,200'), // Sample value; update with real data
                  _buildSummaryCard('Total Revenue', '\$1,800'), // Sample value; update with real data
                ],
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between grid and title

            // Title section for My Projects
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // List of user's projects
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // Sample data; adjust as needed
              itemBuilder: (context, index) {
                // Sample status for each project (e.g., Active, Completed, Pending)
                List<String> statuses = ['Active', 'Completed', 'Pending'];
                return _buildMyProjectItem(
                  'Project ${index + 1}',
                  '\$${(index + 1) * 200}', // Sample invested amount
                  '${(index + 1) * 3} months', // Sample duration
                  statuses[index % statuses.length], // Cycle through statuses
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}