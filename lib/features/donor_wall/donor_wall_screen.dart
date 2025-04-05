import 'package:flutter/material.dart';

class DonorWallScreen extends StatelessWidget {
  const DonorWallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Wall'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'All Donors'),
                Tab(text: 'Major Donors'),
                Tab(text: 'Monthly Donors'),
              ],
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildDonorList(context, _getAllDonors()),
                  _buildDonorList(context, _getMajorDonors()),
                  _buildDonorList(context, _getMonthlyDonors()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Donor> _getAllDonors() {
    return [
      Donor(
        name: 'John Smith',
        amount: 1000,
        date: DateTime(2024, 3, 1),
        isMonthly: false,
        isMajor: true,
      ),
      Donor(
        name: 'Jane Doe',
        amount: 500,
        date: DateTime(2024, 2, 15),
        isMonthly: true,
        isMajor: false,
      ),
      Donor(
        name: 'Acme Corporation',
        amount: 5000,
        date: DateTime(2024, 2, 1),
        isMonthly: false,
        isMajor: true,
      ),
      Donor(
        name: 'Sarah Johnson',
        amount: 100,
        date: DateTime(2024, 1, 20),
        isMonthly: true,
        isMajor: false,
      ),
      Donor(
        name: 'Michael Brown',
        amount: 2500,
        date: DateTime(2024, 1, 10),
        isMonthly: false,
        isMajor: true,
      ),
    ];
  }

  List<Donor> _getMajorDonors() {
    return _getAllDonors().where((donor) => donor.isMajor).toList();
  }

  List<Donor> _getMonthlyDonors() {
    return _getAllDonors().where((donor) => donor.isMonthly).toList();
  }

  Widget _buildDonorList(BuildContext context, List<Donor> donors) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: donors.length,
      itemBuilder: (context, index) {
        final donor = donors[index];
        return _buildDonorCard(context, donor);
      },
    );
  }

  Widget _buildDonorCard(BuildContext context, Donor donor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  donor.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (donor.isMajor)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Major Donor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  '\$${donor.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (donor.isMonthly) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.repeat,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Monthly',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Donated on ${_formatDate(donor.date)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Sort by'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show sort options
                },
              ),
              ListTile(
                title: const Text('Filter by amount'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show amount filter options
                },
              ),
              ListTile(
                title: const Text('Filter by date'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show date filter options
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Donor {
  final String name;
  final double amount;
  final DateTime date;
  final bool isMonthly;
  final bool isMajor;

  Donor({
    required this.name,
    required this.amount,
    required this.date,
    required this.isMonthly,
    required this.isMajor,
  });
} 