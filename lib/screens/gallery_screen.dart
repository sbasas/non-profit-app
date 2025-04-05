import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> _categories = [
    'All',
    'Events',
    'Volunteers',
    'Community',
    'Projects',
  ];
  String _selectedCategory = 'All';

  // Mock gallery data - in a real app, this would come from a backend
  final List<GalleryItem> _galleryItems = [
    GalleryItem(
      imageUrl: 'https://example.com/event1.jpg',
      category: 'Events',
      title: 'Community Cleanup Day',
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    GalleryItem(
      imageUrl: 'https://example.com/volunteer1.jpg',
      category: 'Volunteers',
      title: 'Volunteer Training',
      date: DateTime.now().subtract(const Duration(days: 10)),
    ),
    GalleryItem(
      imageUrl: 'https://example.com/community1.jpg',
      category: 'Community',
      title: 'Community Garden',
      date: DateTime.now().subtract(const Duration(days: 15)),
    ),
    GalleryItem(
      imageUrl: 'https://example.com/project1.jpg',
      category: 'Projects',
      title: 'School Renovation',
      date: DateTime.now().subtract(const Duration(days: 20)),
    ),
    GalleryItem(
      imageUrl: 'https://example.com/event2.jpg',
      category: 'Events',
      title: 'Fundraising Gala',
      date: DateTime.now().subtract(const Duration(days: 25)),
    ),
    GalleryItem(
      imageUrl: 'https://example.com/volunteer2.jpg',
      category: 'Volunteers',
      title: 'Volunteer Appreciation',
      date: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = _selectedCategory == 'All'
        ? _galleryItems
        : _galleryItems.where((item) => item.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // TODO: Implement refresh logic
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return GestureDetector(
                    onTap: () {
                      _showGalleryItemDetails(context, item);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            item.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            right: 8,
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement photo upload functionality
        },
        child: const Icon(Icons.add_photo_alternate),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  void _showGalleryItemDetails(BuildContext context, GalleryItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailScreen(item: item),
      ),
    );
  }
}

class GalleryItem {
  final String imageUrl;
  final String category;
  final String title;
  final DateTime date;

  GalleryItem({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.date,
  });
}

class GalleryDetailScreen extends StatelessWidget {
  final GalleryItem item;

  const GalleryDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.category} • ${_formatDate(item.date)}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is a placeholder description for the gallery item. In a real app, this would contain detailed information about the image, event, or project it represents.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
} 
} 