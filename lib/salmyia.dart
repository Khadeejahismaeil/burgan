import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchDetailPage extends StatelessWidget {
  final String branchName;
  final String address;
  final String openingHours;
  final String contactInfo;
  final String services;
  final String imagePath;
  final String googleMapsLocation;

  const BranchDetailPage({
    super.key,
    required this.branchName,
    required this.address,
    required this.openingHours,
    required this.contactInfo,
    required this.services,
    required this.imagePath,
    required this.googleMapsLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(branchName),
        backgroundColor: const Color.fromARGB(255, 10, 95, 164),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Branch Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Additional Information
              const Text(
                'Additional Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(contactInfo, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              // Services
              const Text(
                'Services Offered',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(services, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              // Opening Hours
              const Text(
                'Opening Hours',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(openingHours, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),

              // Location with Address and Map Link
              const Text(
                'Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(address, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              // Button to Open Google Maps
              ElevatedButton.icon(
                onPressed: () => _launchMaps(googleMapsLocation),
                icon: const Icon(Icons.map),
                label: const Text('Open in Google Maps'),
                style: ElevatedButton.styleFrom(
                  iconColor: const Color.fromARGB(255, 10, 95, 164), // Button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchMaps(String location) async {
    final Uri googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$location');
    if (await canLaunch(googleMapsUrl.toString())) {
      await launch(googleMapsUrl.toString());
    } else {
      throw 'Could not launch Google Maps';
    }
  }
}
