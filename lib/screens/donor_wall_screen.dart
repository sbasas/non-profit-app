import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorWallScreen extends StatefulWidget {
  const DonorWallScreen({super.key});

  @override
  State<DonorWallScreen> createState() => _DonorWallScreenState();
}

class _DonorWallScreenState extends State<DonorWallScreen> {
  final List<DonorCategory> _categories = [
    DonorCategory(
      name: 'Visionary Circle',
      minAmount: 100000,
      donors: [
        Donor(
          name: 'John & Sarah Smith',
          amount: 150000,
          date: '2024',
          message: 'Supporting education for all',
        ),
        Donor(
          name: 'ABC Foundation',
          amount: 120000,
          date: '2024',
          message: 'Building stronger communities',
        ),
      ],
    ),
    DonorCategory(
      name: 'Leadership Circle',
      minAmount: 50000,
      donors: [
        Donor(
          name: 'Michael Johnson',
          amount: 75000,
          date: '2024',
          message: 'Investing in our future',
        ),
        Donor(
          name: 'XYZ Corporation',
          amount: 60000,
          date: '2024',
          message: 'Corporate social responsibility',
        ),
      ],
    ),
    DonorCategory(
      name: 'Benefactor Circle',
      minAmount: 25000,
      donors: [
        Donor(
          name: 'Emily Davis',
          amount: 30000,
          date: '2024',
          message: 'Making a difference together',
        ),
        Donor(
          name: 'Community Fund',
          amount: 28000,
          date: '2024',
          message: 'Supporting local initiatives',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Recognition'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Generous Supporters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We are deeply grateful to our donors who make our work possible. Their generosity helps us create lasting change in our community.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return _buildDonorCategory(category);
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Recent Donations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildRecentDonations(),
            const SizedBox(height: 32),
            const Text(
              'Donor Impact Stories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildImpactStories(),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorCategory(DonorCategory category) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${category.minAmount.toStringAsFixed(0)}+',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: category.donors.map((donor) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        donor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${donor.amount.toStringAsFixed(0)} • ${donor.date}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        donor.message,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentDonations() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDonationItem(
              name: 'Robert Wilson',
              amount: 1000,
              date: 'Today',
            ),
            const Divider(),
            _buildDonationItem(
              name: 'Lisa Thompson',
              amount: 500,
              date: 'Yesterday',
            ),
            const Divider(),
            _buildDonationItem(
              name: 'David Miller',
              amount: 2500,
              date: '2 days ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationItem({
    required String name,
    required double amount,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactStories() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildImpactStory(
              title: 'Education Fund',
              description: 'Thanks to generous donations, we\'ve provided scholarships to 50 students this year.',
              imageUrl: 'https://example.com/education.jpg',
            ),
            const SizedBox(height: 16),
            _buildImpactStory(
              title: 'Community Center',
              description: 'Donor contributions helped build a new community center serving 1,000+ residents.',
              imageUrl: 'https://example.com/center.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactStory({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 150,
              color: Colors.grey[300],
              child: const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class DonorCategory {
  final String name;
  final double minAmount;
  final List<Donor> donors;

  DonorCategory({
    required this.name,
    required this.minAmount,
    required this.donors,
  });
}

class Donor {
  final String name;
  final double amount;
  final String date;
  final String message;

  Donor({
    required this.name,
    required this.amount,
    required this.date,
    required this.message,
  });
} 