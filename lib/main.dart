import 'package:flutter/material.dart';
import 'list.dart'; // Make sure this file contains the ListScreen widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burgan Bank',
      home: SplashScreen(), // Change home to SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Initial opacity for the splash elements

  @override
  void initState() {
    super.initState();
    // Start the fade-in effect after the widget is built
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0; // Change opacity to 1 to fade in
      });
    });

    // Navigate to the home page after 3 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the splash screen background color
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration:
              const Duration(seconds: 2), // Duration of the fade-in effect
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/download.png", // Replace with your splash image if needed
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Burgan Bank',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assets/images/download.png",
            height: 40,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 95, 164),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Burgan Bank',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Add a brief description under the logo, summarizing Burgan Bank’s services",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the ListScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Explore Branches'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
