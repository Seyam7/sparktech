import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  GridWidget({super.key});

  final reels = [
    {
      'title': 'Vocabulary 101',
      'creator': 'Jessica Roy',
      'thumbnail': 'assets/images/vocabulary_thumbnail.jpg',
    },
    {
      'title': 'English Listening',
      'creator': 'Jessica Roy',
      'thumbnail': 'assets/images/english_listening_thumbnail.jpg',
    },
    {
      'title': 'Trigonometry Basic',
      'creator': 'Jessica Roy',
      'thumbnail': 'assets/images/trigonometry_thumbnail.jpg',
    },
    {
      'title': 'Geometry Advance',
      'creator': 'Jessica Roy',
      'thumbnail': 'assets/images/geometry_thumbnail.jpg',
    },
    {
      'title': 'Geometry Advance',
      'creator': 'Jessica Roy',
      'thumbnail': 'assets/images/geometry_thumbnail.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _buildReelCard(reels[index]);
        },
      ),
    );
  }
}

Widget _buildReelCard(Map<String, String> reel) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage(reel['thumbnail']!),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
              stops: const [0.6, 1.0],
            ),
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                reel['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/profile_avatar.jpg'),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    reel['creator']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Play button
        if (reel['title'] != 'Vocabulary 101')
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
      ],
    ),
  );
}
