import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  final List<SocialMediaPlatform> _platforms = [
    SocialMediaPlatform(
      name: 'Facebook',
      icon: Icons.facebook,
      url: 'https://facebook.com/nonprofit',
      followers: '10.5K',
      posts: '1.2K',
    ),
    SocialMediaPlatform(
      name: 'Twitter',
      icon: Icons.campaign,
      url: 'https://twitter.com/nonprofit',
      followers: '8.2K',
      posts: '3.5K',
    ),
    SocialMediaPlatform(
      name: 'Instagram',
      icon: Icons.camera_alt,
      url: 'https://instagram.com/nonprofit',
      followers: '15.3K',
      posts: '2.8K',
    ),
    SocialMediaPlatform(
      name: 'LinkedIn',
      icon: Icons.business,
      url: 'https://linkedin.com/company/nonprofit',
      followers: '5.7K',
      posts: '850',
    ),
  ];

  final List<SocialMediaPost> _recentPosts = [
    SocialMediaPost(
      platform: 'Facebook',
      content: 'Join us for our annual community cleanup day this Saturday!',
      imageUrl: 'https://example.com/cleanup.jpg',
      likes: '245',
      comments: '32',
      shares: '18',
      timeAgo: '2 hours ago',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      content: 'We\'re excited to announce our new education initiative! #EducationForAll',
      imageUrl: 'https://example.com/education.jpg',
      likes: '156',
      comments: '24',
      shares: '45',
      timeAgo: '5 hours ago',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      content: 'Check out these amazing before and after photos from our latest project!',
      imageUrl: 'https://example.com/project.jpg',
      likes: '432',
      comments: '56',
      shares: '78',
      timeAgo: '1 day ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connect With Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Follow us on social media to stay updated with our latest news, events, and impact stories.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: _platforms.length,
              itemBuilder: (context, index) {
                final platform = _platforms[index];
                return _buildPlatformCard(platform);
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Recent Posts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _recentPosts.length,
              itemBuilder: (context, index) {
                final post = _recentPosts[index];
                return _buildPostCard(post);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement share functionality
        },
        child: const Icon(Icons.share),
      ),
    );
  }

  Widget _buildPlatformCard(SocialMediaPlatform platform) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _launchUrl(platform.url),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                platform.icon,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                platform.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${platform.followers} Followers',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                '${platform.posts} Posts',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard(SocialMediaPost post) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              _getPlatformIcon(post.platform),
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              post.platform,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(post.timeAgo),
            trailing: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // TODO: Implement share functionality
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(post.content),
          ),
          if (post.imageUrl.isNotEmpty) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
              child: Image.network(
                post.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildInteractionButton(
                  icon: Icons.favorite,
                  count: post.likes,
                ),
                const SizedBox(width: 16),
                _buildInteractionButton(
                  icon: Icons.comment,
                  count: post.comments,
                ),
                const SizedBox(width: 16),
                _buildInteractionButton(
                  icon: Icons.share,
                  count: post.shares,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton({
    required IconData icon,
    required String count,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  IconData _getPlatformIcon(String platform) {
    switch (platform) {
      case 'Facebook':
        return Icons.facebook;
      case 'Twitter':
        return Icons.campaign;
      case 'Instagram':
        return Icons.camera_alt;
      case 'LinkedIn':
        return Icons.business;
      default:
        return Icons.public;
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}

class SocialMediaPlatform {
  final String name;
  final IconData icon;
  final String url;
  final String followers;
  final String posts;

  SocialMediaPlatform({
    required this.name,
    required this.icon,
    required this.url,
    required this.followers,
    required this.posts,
  });
}

class SocialMediaPost {
  final String platform;
  final String content;
  final String imageUrl;
  final String likes;
  final String comments;
  final String shares;
  final String timeAgo;

  SocialMediaPost({
    required this.platform,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.timeAgo,
  });
} 