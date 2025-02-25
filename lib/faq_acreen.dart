import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class FAQScreen extends StatelessWidget {
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
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // FAQ List
            _buildFAQItem(
              'What is ABI Wallet?',
              'ABI Wallet is an investment platform that allows users to invest in various projects, including short-term, long-term, and Shariah-compliant options, to grow their wealth securely and ethically.',
            ),
            _buildFAQItem(
              'How do I start investing?',
              'To start investing, sign up, log in, explore projects in the "All Projects" section, and select a project to invest in. Enter your investment amount and confirm to proceed.',
            ),
            _buildFAQItem(
              'What are the risks of investing through ABI Wallet?',
              'While we aim to provide secure and transparent opportunities, all investments carry some risk. We recommend reviewing project details, durations, and returns, and consulting with a financial advisor.',
            ),
            _buildFAQItem(
              'Are there any fees for using ABI Wallet?',
              'ABI Wallet charges a small transaction fee for each investment, details of which are available in our Terms of Service. There are no subscription fees for using the platform.',
            ),
            _buildFAQItem(
              'How can I track my investments?',
              'You can track your investments in the "My Projects" section of the app, where you’ll see details like invested amounts, returns, and project statuses.',
            ),
            _buildFAQItem(
              'What is a Shariah-compliant project?',
              'A Shariah-compliant project adheres to Islamic financial principles, avoiding interest (riba), uncertainty (gharar), and prohibited activities, ensuring ethical and Halal investments.',
            ),
            SizedBox(height: 20), // Add extra space for scrolling
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        iconColor: Colors.green,
        collapsedIconColor: Colors.green,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}