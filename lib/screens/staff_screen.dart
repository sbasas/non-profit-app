import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Directory'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStaffCard(
            name: 'John Smith',
            position: 'Executive Director',
            email: 'john.smith@nonprofit.org',
            phone: '(123) 456-7890',
            bio: 'With over 15 years of experience in non-profit management, John leads our organization with passion and dedication.',
            imageUrl: 'assets/images/staff1.jpg',
          ),
          _buildStaffCard(
            name: 'Sarah Johnson',
            position: 'Program Manager',
            email: 'sarah.johnson@nonprofit.org',
            phone: '(123) 456-7891',
            bio: 'Sarah oversees our community programs and ensures their successful implementation.',
            imageUrl: 'assets/images/staff2.jpg',
          ),
          _buildStaffCard(
            name: 'Michael Brown',
            position: 'Volunteer Coordinator',
            email: 'michael.brown@nonprofit.org',
            phone: '(123) 456-7892',
            bio: 'Michael manages our volunteer program and helps connect people with meaningful opportunities.',
            imageUrl: 'assets/images/staff3.jpg',
          ),
          _buildStaffCard(
            name: 'Emily Davis',
            position: 'Development Director',
            email: 'emily.davis@nonprofit.org',
            phone: '(123) 456-7893',
            bio: 'Emily leads our fundraising efforts and donor relations.',
            imageUrl: 'assets/images/staff4.jpg',
          ),
          _buildStaffCard(
            name: 'David Wilson',
            position: 'Community Outreach Coordinator',
            email: 'david.wilson@nonprofit.org',
            phone: '(123) 456-7894',
            bio: 'David builds relationships with community partners and stakeholders.',
            imageUrl: 'assets/images/staff5.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildStaffCard({
    required String name,
    required String position,
    required String email,
    required String phone,
    required String bio,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imageUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        position,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              bio,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    // TODO: Implement email functionality
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    // TODO: Implement phone call functionality
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: Implement view profile functionality
                  },
                  child: const Text('View Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 