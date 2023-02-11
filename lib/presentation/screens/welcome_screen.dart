import 'package:flutter/material.dart';
import 'package:whatsapp/presentation/screens/registration_screen.dart';
import 'package:whatsapp/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                "Welcome to WhatsApp Clone",
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset("assets/brand.png"),
              ),
            ),
            const Text(
              "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RegistrationScreen(),
                  ),
                );
              },
              child: const Text(
                "AGREE AND CONTINUE",
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
