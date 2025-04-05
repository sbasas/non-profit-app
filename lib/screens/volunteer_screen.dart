import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedInterest = 'Community Service';
  bool _isAvailableWeekdays = false;
  bool _isAvailableWeekends = false;

  final List<String> _interests = [
    'Community Service',
    'Education',
    'Environment',
    'Health & Wellness',
    'Event Planning',
    'Administrative Support',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildVolunteerForm(),
            const SizedBox(height: 24),
            _buildOpportunitiesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.volunteer_activism,
            size: 48,
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          Text(
            'Join Our Volunteer Team',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Make a difference in your community by volunteering with us. Your time and skills can help create positive change.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildVolunteerForm() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Volunteer Information',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedInterest,
                decoration: const InputDecoration(
                  labelText: 'Area of Interest',
                  border: OutlineInputBorder(),
                ),
                items: _interests.map((String interest) {
                  return DropdownMenuItem<String>(
                    value: interest,
                    child: Text(interest),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedInterest = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Availability',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                title: const Text('Available on Weekdays'),
                value: _isAvailableWeekdays,
                onChanged: (bool value) {
                  setState(() {
                    _isAvailableWeekdays = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Available on Weekends'),
                value: _isAvailableWeekends,
                onChanged: (bool value) {
                  setState(() {
                    _isAvailableWeekends = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement volunteer registration
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Submit Application',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpportunitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Opportunities',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildOpportunityCard(
          title: 'Community Outreach',
          description: 'Help us connect with local communities and spread awareness about our programs.',
          requirements: 'Good communication skills, friendly personality',
          timeCommitment: '4 hours/week',
        ),
        _buildOpportunityCard(
          title: 'Event Coordination',
          description: 'Assist in planning and organizing community events and fundraisers.',
          requirements: 'Organizational skills, attention to detail',
          timeCommitment: '6 hours/week',
        ),
        _buildOpportunityCard(
          title: 'Educational Support',
          description: 'Help with tutoring and educational programs for underprivileged youth.',
          requirements: 'Teaching experience preferred',
          timeCommitment: '3 hours/week',
        ),
      ],
    );
  }

  Widget _buildOpportunityCard({
    required String title,
    required String description,
    required String requirements,
    required String timeCommitment,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle, size: 16, color: Colors.blue),
                const SizedBox(width: 8),
                const Text('Requirements:'),
                const SizedBox(width: 8),
                Text(
                  requirements,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.blue),
                const SizedBox(width: 8),
                const Text('Time Commitment:'),
                const SizedBox(width: 8),
                Text(
                  timeCommitment,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement apply functionality
              },
              child: const Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
} 