import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class ShariahKnowledgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      initialIndex: 0, // Default to Home (index 0), adjust based on navigation logic
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Islamic Business Knowledge in a Halal Way',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // Introduction
            Text(
              'Understanding Halal Business Practices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'In Islam, conducting business in a Halal manner involves adhering to ethical principles that ensure fairness, transparency, and compliance with Shariah law. This includes avoiding interest (riba), uncertainty (gharar), and prohibited activities (haram).',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),

            // Key Principles
            Text(
              'Key Principles of Halal Business',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            _buildPrincipleItem('Avoid Riba', 'Prohibit interest-based transactions to ensure fairness.'),
            _buildPrincipleItem('Transparency', 'Ensure clear and honest dealings with all stakeholders.'),
            _buildPrincipleItem('No Gharar', 'Avoid uncertainty or speculative practices in contracts.'),
            _buildPrincipleItem('Halal Products', 'Offer only products and services permissible under Shariah.'),
            SizedBox(height: 20),

            // Benefits
            Text(
              'Benefits of Halal Business Practices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Adopting Halal business practices fosters trust, builds a strong reputation, and aligns with ethical and religious values, attracting a wide customer base, especially in Muslim-majority markets.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20), // Add extra space for scrolling
          ],
        ),
      ),
    );
  }

  Widget _buildPrincipleItem(String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}