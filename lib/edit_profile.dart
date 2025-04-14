import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String phoneNo;
  final String nid;
  final String gender;
  final String dob;
  final String address;
  final String bankName;
  final String branchName;
  final String accountHolderName;
  final String accountNumber;
  final String profileImagePath;

  const EditProfileScreen({
    required this.userName,
    required this.userEmail,
    required this.phoneNo,
    required this.nid,
    required this.gender,
    required this.dob,
    required this.address,
    required this.bankName,
    required this.branchName,
    required this.accountHolderName,
    required this.accountNumber,
    required this.profileImagePath,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _nidController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;
  late TextEditingController _bankNameController;
  late TextEditingController _branchNameController;
  late TextEditingController _accountHolderNameController;
  late TextEditingController _accountNumberController;
  String _gender = 'Male'; // Default gender
  File? _profileImage; // Store the selected or captured image



  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
    _emailController = TextEditingController(text: widget.userEmail);
    _phoneController = TextEditingController(text: widget.phoneNo);
    _nidController = TextEditingController(text: widget.nid);
    _dobController = TextEditingController(text: widget.dob);
    _addressController = TextEditingController(text: widget.address);
    _bankNameController = TextEditingController(text: widget.bankName);
    _branchNameController = TextEditingController(text: widget.branchName);
    _accountHolderNameController = TextEditingController(text: widget.accountHolderName);
    _accountNumberController = TextEditingController(text: widget.accountNumber);
    _gender = widget.gender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nidController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _bankNameController.dispose();
    _branchNameController.dispose();
    _accountHolderNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Choose from Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.gallery);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Take a Photo'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.camera);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!) as ImageProvider
                      : AssetImage(widget.profileImagePath) as ImageProvider,
                  backgroundColor: Colors.grey[300],
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, color: Colors.white, size: 30)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Personal Information Fields
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildTextField('Name', _nameController),
            _buildTextField('Email', _emailController),
            _buildTextField('Phone No', _phoneController),
            _buildTextField('NID', _nidController),
            _buildTextField('Date of Birth', _dobController, readOnly: true, onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                _dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
            }),
            _buildTextField('Address', _addressController),
            DropdownButtonFormField<String>(
              value: _gender,
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items: ['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gender = newValue!;
                });
              },
            ),

            SizedBox(height: 20),
            // Banking Information Fields
            Text(
              'Banking',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildTextField('Name of Bank', _bankNameController),
            _buildTextField('Name of Branch', _branchNameController),
            _buildTextField('Account Holder Name', _accountHolderNameController),
            _buildTextField('Account Number', _accountNumberController),

            SizedBox(height: 20),
            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to save changes (e.g., send to backend)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully')),
                  );
                  Navigator.pop(context); // Return to AccountScreen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Use backgroundColor instead of primary
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool readOnly = false, VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          enabled: !readOnly,
        ),
        readOnly: readOnly,
        onTap: onTap,
      ),
    );
  }
}