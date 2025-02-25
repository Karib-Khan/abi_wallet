import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class NewsScreen extends StatelessWidget {
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
              'Latest News',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // News Item 1
            _buildNewsItem(
              'New Investment Opportunity Launched',
              'ABI Wallet introduces a new project offering high returns with a 6-month duration. Learn more today!',
              'Feb 25, 2025',
              'lib/assets/imgs/news.png', // Replace with actual news image
            ),
            SizedBox(height: 20),

            // News Item 2
            _buildNewsItem(
              'Market Trends for 2025',
              'Experts predict a rise in sustainable investment opportunities. Stay ahead with ABI Wallet insights.',
              'Feb 24, 2025',
              'lib/assets/imgs/news.png', // Replace with actual news image
            ),
            SizedBox(height: 20),

            // News Item 3
            _buildNewsItem(
              'User Success Stories',
              'Hear how users doubled their investments with our Shariah-compliant projects. Read their stories now!',
              'Feb 23, 2025',
              'lib/assets/imgs/news.png', // Replace with actual news image
            ),
            SizedBox(height: 20), // Add extra space for scrolling
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(String title, String description, String date, String imagePath) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}