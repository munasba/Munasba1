import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('استكشاف'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildCategories(),
            const SizedBox(height: 24),
            _buildFeaturedVenues(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'ابحث عن قاعات، خدمات...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      ('قاعات', Icons.meeting_room),
      ('بوفيه', Icons.restaurant),
      ('تصوير', Icons.camera_alt),
      ('ديكور', Icons.palette),
      ('موسيقى', Icons.music_note),
      ('نقل', Icons.local_taxi),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الخدمات', style: AppTextStyles.headline3),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: categories.map((cat) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(cat.$2, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(cat.$1, style: AppTextStyles.bodyLarge),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFeaturedVenues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('قاعات مميزة', style: AppTextStyles.headline3),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 280,
                margin: const EdgeInsets.only(left: 12),
                decoration: AppDecorations.cardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.image, color: AppColors.primary),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('قاعة الفيصلية',
                              style: AppTextStyles.bodyLarge),
                          Text('الرياض - 500 ضيف',
                              style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
