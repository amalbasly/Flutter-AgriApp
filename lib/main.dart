import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agricultural Surveillance App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/farm_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.agriculture,
                  size: 100,
                  color: Colors.green,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: emailController,
                  labelText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                _buildGreenButton(
                  text: 'Login',
                  onPressed: _login,
                  width: 200.0,
                ),
                SizedBox(height: 10),
                _buildGreenButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  width: 200.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _buildGreenButton({
    required String text,
    required VoidCallback onPressed,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  void _login() {
    // Validate login credentials
    String email = emailController.text;
    String password = passwordController.text;
    if (isValidCredentials(email, password)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      _showAlertDialog(
        context,
        'Invalid Credentials',
        'Please enter valid email and password.',
      );
    }
  }

  bool isValidCredentials(String email, String password) {
    // Dummy validation, replace with actual authentication logic
    return email == 'projetdrone@gmail.com' && password == 'Drone123';
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/farm_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(
                  labelText: 'Name',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Surname',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Phone Number',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Text(
                  'Drone Details:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Drone Serial Number',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Drone Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                _buildGreenButton(
                  text: 'Sign Up',
                  onPressed: () {
                    // Handle sign-up action
                  },
                  width: 200.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required bool obscureText,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _buildGreenButton({
    required String text,
    required VoidCallback onPressed,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agricultural Surveillance App'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SurveillanceItem(
                  icon: Icons.volume_up,
                  label: 'Sound',
                  status: 'No suspicious sound',
                ),
                SurveillanceItem(
                  icon: Icons.campaign,
                  label: 'Movement',
                  status: 'No suspicious movement',
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SurveillanceItem(
                  icon: Icons.thermostat,
                  label: 'Temperature',
                  status: 'Normal temperature',
                ),
                GestureDetector(
                  onTap: () {
                    // Implement action when camera icon is tapped
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Camera Image'),
                        content: Image.asset('assets/night.jpg'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/night.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _showEmergencyDialog(context),
                child: Text(
                  'Call Emergency',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
                ),
              ),
              DroneBatteryIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Emergency'),
        content: Text('Are you sure you want to call emergency services?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement emergency call functionality
              Navigator.pop(context);
              _showAlertDialog(
                context,
                'Emergency Call',
                'Emergency services have been called.',
              );
            },
            child: Text('Call'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class SurveillanceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String status;

  const SurveillanceItem({
    required this.icon,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            status,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class DroneBatteryIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.battery_full,
            color: Colors.green,
          ),
          SizedBox(width: 5),
          Text(
            '100%',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
