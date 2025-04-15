import 'package:flutter/material.dart';
import 'package:tugas_3_mobile/pages/home_page.dart';
import 'package:tugas_3_mobile/utils/session_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  final Map<String, String> userCredentials = {
    'fikri': '042',
    're': '050',
    'veri': '146',
  };

  void login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (userCredentials[username] == password) {
      // save session
      await SessionManager.saveLoginSession(_usernameController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: _usernameController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // icon toolbox
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.teal.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withAlpha(64),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Icon(Icons.handyman, size: 64, color: Colors.teal),
                    SizedBox(height: 8),
                    Text(
                      'Toolbox',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Login',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text('Login untuk menjalankan aplikasi',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person), labelText: 'Username'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                obscureText: true,
              ),
              if (errorMessage.isNotEmpty)
                Text(errorMessage, style: const TextStyle(color: Colors.red)),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: login,
                      child: const Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
