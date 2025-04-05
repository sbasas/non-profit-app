import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
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
                Tab(text: 'All'),
                Tab(text: 'Events'),
                Tab(text: 'Impact'),
              ],
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGalleryGrid(context),
                  _buildEventsGallery(context),
                  _buildImpactGallery(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return _buildGalleryItem(
          context,
          imageUrl: 'https://picsum.photos/200/200?random=$index',
          title: 'Gallery Item ${index + 1}',
          date: 'March ${index + 1}, 2024',
        );
      },
    );
  }

  Widget _buildEventsGallery(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildGalleryItem(
          context,
          imageUrl: 'https://picsum.photos/200/200?events=$index',
          title: 'Event ${index + 1}',
          date: 'March ${index + 1}, 2024',
        );
      },
    );
  }

  Widget _buildImpactGallery(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildGalleryItem(
          context,
          imageUrl: 'https://picsum.photos/200/200?impact=$index',
          title: 'Impact Story ${index + 1}',
          date: 'March ${index + 1}, 2024',
        );
      },
    );
  }

  Widget _buildGalleryItem(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required String date,
  }) {
    return GestureDetector(
      onTap: () {
        _showImageDetails(context, imageUrl, title, date);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDetails(
    BuildContext context,
    String imageUrl,
    String title,
    String date,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
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
                          date,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Description of the image and its significance to our organization. This could include details about the event, the people involved, and the impact created.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                // TODO: Implement share functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {
                                // TODO: Implement favorite functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.download),
                              onPressed: () {
                                // TODO: Implement download functionality
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
          },
        );
      },
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
            ],
          ),
        );
      },
    );
  }
} 