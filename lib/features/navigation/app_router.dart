import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_screen.dart';
import '../../features/about/about_screen.dart';
import '../../features/mission/mission_screen.dart';
import '../../features/events/events_screen.dart';
import '../../features/staff/staff_screen.dart';
import '../../features/notifications/notifications_screen.dart';
import '../../features/weather/weather_screen.dart';
import '../../features/donate/donate_screen.dart';
import '../../features/volunteer/volunteer_screen.dart';
import '../../features/gallery/gallery_screen.dart';
import '../../features/blog/blog_screen.dart';
import '../../features/contact/contact_screen.dart';
import '../../features/newsletter/newsletter_screen.dart';
import '../../features/donor_wall/donor_wall_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Non-Profit Organization'),
            ),
            drawer: _buildDrawer(context),
            body: child,
            bottomNavigationBar: _buildBottomNavigationBar(context),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => const AboutScreen(),
          ),
          GoRoute(
            path: '/mission',
            builder: (context, state) => const MissionScreen(),
          ),
          GoRoute(
            path: '/events',
            builder: (context, state) => const EventsScreen(),
          ),
          GoRoute(
            path: '/staff',
            builder: (context, state) => const StaffScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: '/weather',
            builder: (context, state) => const WeatherScreen(),
          ),
          GoRoute(
            path: '/donate',
            builder: (context, state) => const DonateScreen(),
          ),
          GoRoute(
            path: '/volunteer',
            builder: (context, state) => const VolunteerScreen(),
          ),
          GoRoute(
            path: '/gallery',
            builder: (context, state) => const GalleryScreen(),
          ),
          GoRoute(
            path: '/blog',
            builder: (context, state) => const BlogScreen(),
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) => const ContactScreen(),
          ),
          GoRoute(
            path: '/newsletter',
            builder: (context, state) => const NewsletterScreen(),
          ),
          GoRoute(
            path: '/donor-wall',
            builder: (context, state) => const DonorWallScreen(),
          ),
        ],
      ),
    ],
  );

  static Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Non-Profit Organization',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              context.go('/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Mission'),
            onTap: () {
              Navigator.pop(context);
              context.go('/mission');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Events'),
            onTap: () {
              Navigator.pop(context);
              context.go('/events');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Staff'),
            onTap: () {
              Navigator.pop(context);
              context.go('/staff');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
              context.go('/notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Weather'),
            onTap: () {
              Navigator.pop(context);
              context.go('/weather');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Donate'),
            onTap: () {
              Navigator.pop(context);
              context.go('/donate');
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('Volunteer'),
            onTap: () {
              Navigator.pop(context);
              context.go('/volunteer');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              context.go('/gallery');
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Blog'),
            onTap: () {
              Navigator.pop(context);
              context.go('/blog');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              context.go('/contact');
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Newsletter'),
            onTap: () {
              Navigator.pop(context);
              context.go('/newsletter');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt),
            title: const Text('Donor Wall'),
            onTap: () {
              Navigator.pop(context);
              context.go('/donor-wall');
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(context),
      onTap: (index) {
        _onItemTapped(context, index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Donate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.volunteer_activism),
          label: 'Volunteer',
        ),
      ],
    );
  }

  static int _getSelectedIndex(BuildContext context) {
    final String path = GoRouterState.of(context).uri.path;
    switch (path) {
      case '/':
        return 0;
      case '/events':
        return 1;
      case '/donate':
        return 2;
      case '/volunteer':
        return 3;
      default:
        return 0;
    }
  }

  static void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/events');
        break;
      case 2:
        context.go('/donate');
        break;
      case 3:
        context.go('/volunteer');
        break;
    }
  }
} 