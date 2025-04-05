import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Mission'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.flag,
                      size: 60,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Our Mission Statement',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'To create positive change in our community through sustainable initiatives, education, and collaborative efforts that empower individuals and strengthen our society.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Our Goals',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildGoalCard(
              title: 'Community Development',
              description: 'Foster sustainable community growth through education and resource development.',
              icon: Icons.people,
            ),
            _buildGoalCard(
              title: 'Environmental Stewardship',
              description: 'Promote environmental awareness and implement sustainable practices.',
              icon: Icons.eco,
            ),
            _buildGoalCard(
              title: 'Education & Empowerment',
              description: 'Provide educational opportunities and resources to empower individuals.',
              icon: Icons.school,
            ),
            _buildGoalCard(
              title: 'Social Impact',
              description: 'Create measurable positive impact through targeted programs and initiatives.',
              icon: Icons.trending_up,
            ),
            const SizedBox(height: 20),
            Text(
              'How We Achieve Our Mission',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildMethodCard(
              title: 'Community Programs',
              description: 'Implementing programs that address specific community needs.',
              icon: Icons.work,
            ),
            _buildMethodCard(
              title: 'Partnerships',
              description: 'Collaborating with local organizations and businesses.',
              icon: Icons.handshake,
            ),
            _buildMethodCard(
              title: 'Volunteer Engagement',
              description: 'Mobilizing volunteers to support our initiatives.',
              icon: Icons.volunteer_activism,
            ),
            _buildMethodCard(
              title: 'Advocacy',
              description: 'Advocating for policies that support our mission.',
              icon: Icons.mic,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 30, color: Colors.blue),
            ),
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

  Widget _buildMethodCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
} 