import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to notification settings
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Sample notifications
        itemBuilder: (context, index) {
          return _buildNotificationCard(
            context,
            title: _getNotificationTitle(index),
            message: _getNotificationMessage(index),
            time: DateTime.now().subtract(Duration(hours: index)),
            isRead: index % 3 == 0, // Sample read status
            type: _getNotificationType(index),
          );
        },
      ),
    );
  }

  String _getNotificationTitle(int index) {
    final types = [
      'Event Reminder',
      'Donation Received',
      'Volunteer Opportunity',
      'News Update',
      'Thank You',
    ];
    return types[index % types.length];
  }

  String _getNotificationMessage(int index) {
    final messages = [
      'Your upcoming event starts in 2 days!',
      'Thank you for your generous donation of \$100',
      'New volunteer opportunity available: Community Cleanup',
      'Check out our latest blog post about our impact',
      'We appreciate your continued support!',
    ];
    return messages[index % messages.length];
  }

  NotificationType _getNotificationType(int index) {
    final types = [
      NotificationType.event,
      NotificationType.donation,
      NotificationType.volunteer,
      NotificationType.news,
      NotificationType.general,
    ];
    return types[index % types.length];
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String message,
    required DateTime time,
    required bool isRead,
    required NotificationType type,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: isRead ? null : Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        leading: _buildNotificationIcon(type),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 4),
            Text(
              _formatTime(time),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            _showNotificationOptions(context);
          },
        ),
        onTap: () {
          // TODO: Handle notification tap
        },
      ),
    );
  }

  Widget _buildNotificationIcon(NotificationType type) {
    IconData icon;
    Color color;

    switch (type) {
      case NotificationType.event:
        icon = Icons.event;
        color = Colors.blue;
        break;
      case NotificationType.donation:
        icon = Icons.favorite;
        color = Colors.red;
        break;
      case NotificationType.volunteer:
        icon = Icons.volunteer_activism;
        color = Colors.green;
        break;
      case NotificationType.news:
        icon = Icons.article;
        color = Colors.orange;
        break;
      case NotificationType.general:
        icon = Icons.notifications;
        color = Colors.purple;
        break;
    }

    return CircleAvatar(
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  void _showNotificationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.mark_email_read),
                title: const Text('Mark as read'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implement mark as read
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Implement delete
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

enum NotificationType {
  event,
  donation,
  volunteer,
  news,
  general,
} 