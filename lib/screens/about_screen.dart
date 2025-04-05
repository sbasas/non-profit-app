import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(Icons.people, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Story',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Founded in 2024, our non-profit organization has been dedicated to making a positive impact in our community. We believe in the power of collective action and the importance of giving back.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Values',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildValueCard(
              icon: Icons.handshake,
              title: 'Community',
              description: 'Building strong, supportive communities through collaboration and mutual respect.',
            ),
            _buildValueCard(
              icon: Icons.visibility,
              title: 'Transparency',
              description: 'Maintaining open communication and accountability in all our operations.',
            ),
            _buildValueCard(
              icon: Icons.eco,
              title: 'Sustainability',
              description: 'Creating lasting change through sustainable practices and long-term solutions.',
            ),
            const SizedBox(height: 20),
            Text(
              'Contact Us',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(Icons.email, 'Email: info@nonprofit.org'),
                    const SizedBox(height: 8),
                    _buildContactInfo(Icons.phone, 'Phone: (123) 456-7890'),
                    const SizedBox(height: 8),
                    _buildContactInfo(Icons.location_on, 'Address: 123 Main St, City, State'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 16),
        Text(text),
      ],
    );
  }
} 