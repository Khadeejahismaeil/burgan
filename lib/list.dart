import 'package:flutter/material.dart';
import 'package:task/salmyia.dart';
 // Make sure to import your branch detail page

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  // List of branches with branch name and details
  final List<Map<String, String>> branches = const [
    {
      'name': 'Head Office',
      'area': 'Sharq',
      'imagePath': 'assets/images/download.png',
      'address': 'Sharq, Kuwait City',
      'openingHours': 'Sun - Thu, 9 AM - 5 PM',
      'contactInfo': 'Phone: +965 1234 5678\nEmail: info@burgan.com',
      'services': 'ATM, Customer Service, Account Management',
      'location': 'Sharq, Kuwait City' // Use the name/location for Google Maps
    },
    {
      'name': 'Salmiya Branch',
      'area': 'Salmiya',
      'imagePath': 'assets/images/download.png',
      'address': 'Salmiya, Block 10',
      'openingHours': 'Sat - Thu, 9 AM - 4 PM',
      'contactInfo': 'Phone: +965 8765 4321\nEmail: salmiya@burgan.com',
      'services': 'ATM, Loans, Account Opening',
      'location': 'Salmiya, Block 10' // Use the name/location for Google Maps
    },
      {
      'name': 'Shamia Branch',
      'area': 'Shamia',
      'imagePath': 'assets/images/download.png',
      'address': 'Shamia, Block 10',
      'openingHours': 'Sat - Thu, 9 AM - 4 PM',
      'contactInfo': 'Phone: +965 8765 4321\nEmail: salmiya@burgan.com',
      'services': 'ATM, Loans, Account Opening',
      'location': 'Shamia, Block 10' // Use the name/location for Google Maps
    },
    {
      'name': 'Sharg Branch',
      'area': 'Sharg',
      'imagePath': 'assets/images/download.png',
      'address': 'Sharg, Block 10',
      'openingHours': 'Sat - Thu, 9 AM - 4 PM',
      'contactInfo': 'Phone: +965 8765 4321\nEmail: salmiya@burgan.com',
      'services': 'ATM, Loans, Account Opening',
      'location': 'Sharg, Block 10' // Use the name/location for Google Maps
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burgan Bank Branches'),
        backgroundColor: const Color.fromARGB(255, 10, 95, 164),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: branches.length,
          itemBuilder: (context, index) {
            final branch = branches[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                leading: ClipOval(
                  child: Image.asset(
                    branch['imagePath']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  branch['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 10, 95, 164),
                  ),
                ),
                subtitle: Text(branch['area']!),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 10, 95, 164),
                ),
                onTap: () {
                  // Navigate to the BranchDetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BranchDetailPage(
                        branchName: branch['name']!,
                        imagePath: branch['imagePath']!,
                        address: branch['address']!,
                        openingHours: branch['openingHours']!,
                        contactInfo: branch['contactInfo']!,
                        services: branch['services']!,
                        googleMapsLocation: branch['location']!, // Pass the location for Google Maps
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
