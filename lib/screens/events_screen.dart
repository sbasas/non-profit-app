import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Implement calendar view
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            title: 'Community Cleanup Day',
            date: DateTime.now().add(const Duration(days: 5)),
            location: 'City Park',
            description: 'Join us for a day of cleaning up our local park and making it beautiful for everyone to enjoy.',
            imageUrl: 'assets/images/cleanup.jpg',
          ),
          _buildEventCard(
            title: 'Educational Workshop',
            date: DateTime.now().add(const Duration(days: 10)),
            location: 'Community Center',
            description: 'Learn about sustainable living practices and how to reduce your environmental footprint.',
            imageUrl: 'assets/images/workshop.jpg',
          ),
          _buildEventCard(
            title: 'Fundraising Gala',
            date: DateTime.now().add(const Duration(days: 15)),
            location: 'Grand Hotel',
            description: 'An evening of celebration and fundraising to support our community initiatives.',
            imageUrl: 'assets/images/gala.jpg',
          ),
          _buildEventCard(
            title: 'Volunteer Training',
            date: DateTime.now().add(const Duration(days: 20)),
            location: 'Organization Headquarters',
            description: 'Training session for new volunteers to learn about our programs and how to get involved.',
            imageUrl: 'assets/images/training.jpg',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add event functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required DateTime date,
    required String location,
    required String description,
    required String imageUrl,
  }) {
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
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('MMMM d, y').format(date),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement RSVP functionality
                      },
                      child: const Text('RSVP'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement share functionality
                      },
                      child: const Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 