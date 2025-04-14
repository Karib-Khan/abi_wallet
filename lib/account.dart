import 'package:flutter/material.dart';
import 'base_scaffold.dart'; // Import the BaseScaffold for consistency
import 'edit_profile.dart'; // Import the EditProfileScreen

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Dummy user data (replace with real data from your backend later)
  final String userName = "John Doe";
  final String userEmail = "john.doe@example.com";
  final String phoneNo = "+1 123-456-7890";
  final String nid = "1234567890";
  final String gender = "Male"; // Can be "Male", "Female", or "Other"
  final String dob = "01/01/1990";
  final String address = "123 Main St, City, Country";
  final String bankName = "Example Bank";
  final String branchName = "Downtown Branch";
  final String accountHolderName = "John Doe";
  final String accountNumber = "1234567890";
  final String profileImagePath = 'lib/assets/imgs/profile.png'; // Placeholder image path

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      initialIndex: 3,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Add padding to ensure content isn’t cut off
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              'Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0), // Add spacing between header and profile section

            // Profile Section
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
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
              child: Row(
                children: [
                  // Profile Picture
                  GestureDetector(
                    onTap: () {
                      // Navigate to EditProfileScreen to change profile picture
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            userName: userName,
                            userEmail: userEmail,
                            phoneNo: phoneNo,
                            nid: nid,
                            gender: gender,
                            dob: dob,
                            address: address,
                            bankName: bankName,
                            branchName: branchName,
                            accountHolderName: accountHolderName,
                            accountNumber: accountNumber,
                            profileImagePath: profileImagePath,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(profileImagePath),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  // User Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          userEmail,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Additional User Information Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildInfoItem('Phone No', phoneNo),
                _buildInfoItem('NID', nid),
                _buildInfoItem('Gender', gender),
                _buildInfoItem('Date of Birth', dob),
                _buildInfoItem('Address', address),
              ],
            ),

            SizedBox(height: 20.0), // Add spacing between sections

            // Banking Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Banking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildInfoItem('Name of Bank', bankName),
                _buildInfoItem('Name of Branch', branchName),
                _buildInfoItem('Account Holder Name', accountHolderName),
                _buildInfoItem('Account Number', accountNumber),
              ],
            ),

            SizedBox(height: 20.0), // Add spacing before Settings

            // Account Settings Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Edit Profile Button
                _buildSettingsItem(
                  icon: Icons.edit,
                  title: 'Edit Profile',
                  onTap: () {
                    // Navigate to EditProfileScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(
                          userName: userName,
                          userEmail: userEmail,
                          phoneNo: phoneNo,
                          nid: nid,
                          gender: gender,
                          dob: dob,
                          address: address,
                          bankName: bankName,
                          branchName: branchName,
                          accountHolderName: accountHolderName,
                          accountNumber: accountNumber,
                          profileImagePath: profileImagePath,
                        ),
                      ),
                    );
                  },
                ),
                // Change Password Button
                _buildSettingsItem(
                  icon: Icons.lock,
                  title: 'Change Password',
                    iconColor: Colors.orangeAccent, // Red icon for logout
                    textColor: Colors.orangeAccent,
                  onTap: () {
                    // Add navigation or action for changing password
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Change Password tapped')),
                    );
                  },
                ),
                // Logout Button (Styled in Red)
                _buildSettingsItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                ),

              ],
            ),
            SizedBox(height: 100.0), // Add extra space to ensure scrolling reaches the bottom
          ],
        ),
      ), // AccountScreen corresponds to index 3 in the bottom navigation bar
    );
  }

  Widget _buildInfoItem(String title, String value) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.green, // Default to green, but can be overridden
    Color textColor = Colors.black, // Default to black, but can be overridden
  }) {
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
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}