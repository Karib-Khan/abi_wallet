import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class AllProjectsScreen extends StatefulWidget {
  @override
  _AllProjectsScreenState createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  Widget _buildProjectItem(String projectName, String minInvestment, String duration) {
    return Container(
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
            height: 100, // Adjust height as needed
            color: Colors.green,
          ),
          SizedBox(width: 10),
          // Project details on the left
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
                  Text('Min. Investment: $minInvestment'),
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
                image: AssetImage('lib/assets/imgs/project.png'), // Replace with your project image
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      initialIndex: 1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Title Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Active Projects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // List of Projects
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling conflict
              itemCount: 6, // Adjust based on your data
              itemBuilder: (context, index) {
                return _buildProjectItem(
                  'Project ${index + 1}',
                  '\$${100 * (index + 1)}', // Example investment amount
                  '${(index + 1) * 3} months', // Example duration
                );
              },
            ),
          ],
        ),
      ), // AllProjectsScreen corresponds to index 1
    );
  }
}