import 'package:flutter/material.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Team'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(context),
          const SizedBox(height: 16),
          _buildDepartmentSection(
            context,
            title: 'Leadership',
            members: [
              _buildStaffMember(
                name: 'John Doe',
                role: 'Executive Director',
                email: 'john.doe@nonprofit.org',
                phone: '(123) 456-7890',
                imageUrl: 'https://via.placeholder.com/150',
              ),
              _buildStaffMember(
                name: 'Jane Smith',
                role: 'Deputy Director',
                email: 'jane.smith@nonprofit.org',
                phone: '(123) 456-7891',
                imageUrl: 'https://via.placeholder.com/150',
              ),
            ],
          ),
          _buildDepartmentSection(
            context,
            title: 'Programs',
            members: [
              _buildStaffMember(
                name: 'Mike Johnson',
                role: 'Program Manager',
                email: 'mike.johnson@nonprofit.org',
                phone: '(123) 456-7892',
                imageUrl: 'https://via.placeholder.com/150',
              ),
              _buildStaffMember(
                name: 'Sarah Williams',
                role: 'Program Coordinator',
                email: 'sarah.williams@nonprofit.org',
                phone: '(123) 456-7893',
                imageUrl: 'https://via.placeholder.com/150',
              ),
            ],
          ),
          _buildDepartmentSection(
            context,
            title: 'Operations',
            members: [
              _buildStaffMember(
                name: 'David Brown',
                role: 'Operations Manager',
                email: 'david.brown@nonprofit.org',
                phone: '(123) 456-7894',
                imageUrl: 'https://via.placeholder.com/150',
              ),
              _buildStaffMember(
                name: 'Emily Davis',
                role: 'Administrative Assistant',
                email: 'emily.davis@nonprofit.org',
                phone: '(123) 456-7895',
                imageUrl: 'https://via.placeholder.com/150',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search staff members...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  Widget _buildDepartmentSection(
    BuildContext context, {
    required String title,
    required List<Widget> members,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...members,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStaffMember({
    required String name,
    required String role,
    required String email,
    required String phone,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                // TODO: Implement messaging
              },
            ),
          ],
        ),
      ),
    );
  }
} 