import 'package:flutter/material.dart';
import 'router.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  // String email="", password="", fullname="";
  // TextEditingController emailcontroller= new TextEditingController();
  // TextEditingController passcontroller= new TextEditingController();
  // TextEditingController namecontroller= new TextEditingController();

  registration() async {
    String fullName = _fullNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Optional: Update display name
      await userCredential.user!.updateDisplayName(fullName);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );

      // Navigate to home or login page
      Navigator.pushReplacementNamed(context, '/login');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
      } else if (e.code == 'weak-password') {
        message = 'Password should be at least 6 characters';
      } else {
        message = 'Something went wrong';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
  }

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image at the top
                // Logo Image with rounded edges
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                  child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/imgs/logo2.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // "Sign Up" Text
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // Full Name input field
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Email input field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),

                // Password input field
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 20),

                // Create Account Button
                ElevatedButton(
                  onPressed:registration
                    // Add register functionality
                  ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green background
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(double.infinity, 60),

                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Already have an account Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
