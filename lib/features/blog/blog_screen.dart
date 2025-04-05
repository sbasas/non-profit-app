import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildBlogPost(
            context,
            title: 'Blog Post ${index + 1}',
            excerpt: 'This is a sample blog post about our organization\'s work and impact in the community. It highlights our recent achievements and future goals.',
            author: 'John Doe',
            date: 'March ${index + 1}, 2024',
            imageUrl: 'https://picsum.photos/800/400?blog=$index',
            category: _getCategory(index),
          );
        },
      ),
    );
  }

  String _getCategory(int index) {
    final categories = [
      'News',
      'Events',
      'Impact Stories',
      'Volunteer Spotlight',
      'Donor Stories',
    ];
    return categories[index % categories.length];
  }

  Widget _buildBlogPost(
    BuildContext context, {
    required String title,
    required String excerpt,
    required String author,
    required String date,
    required String imageUrl,
    required String category,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                },
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  excerpt,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'By $author',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.favorite_border),
                      label: const Text('Like'),
                      onPressed: () {
                        // TODO: Implement like functionality
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.comment),
                      label: const Text('Comment'),
                      onPressed: () {
                        // TODO: Implement comment functionality
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.share),
                      label: const Text('Share'),
                      onPressed: () {
                        // TODO: Implement share functionality
                      },
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
                title: const Text('Filter by date'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show date filter options
                },
              ),
              ListTile(
                title: const Text('Filter by category'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show category filter options
                },
              ),
              ListTile(
                title: const Text('Filter by author'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () {
                  // TODO: Show author filter options
                },
              ),
            ],
          ),
        );
      },
    );
  }
} 