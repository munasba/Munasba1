import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حسابي'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildStats(),
            const SizedBox(height: 24),
            _buildSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppColors.goldGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text('أحمد محمد', style: AppTextStyles.headline2),
        Text('ahmed@email.com', style: AppTextStyles.bodyMedium),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _buildStatCard('12', 'مناسبة'),
        const SizedBox(width: 12),
        _buildStatCard('350', 'ضيف'),
        const SizedBox(width: 12),
        _buildStatCard('8', 'قادمة'),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppDecorations.cardDecoration,
        child: Column(
          children: [
            Text(value, style: AppTextStyles.headline1.copyWith(
              color: AppColors.primary,
            )),
            Text(label, style: AppTextStyles.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingTile(
          icon: Icons.dark_mode_outlined,
          title: 'الوضع الداكن',
          trailing: Switch(
            value: context.watch<ThemeProvider>().isDarkMode,
            onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
          ),
        ),
        _buildSettingTile(
          icon: Icons.notifications_outlined,
          title: 'الإشعارات',
          trailing: const Icon(Icons.chevron_left),
        ),
        _buildSettingTile(
          icon: Icons.language,
          title: 'اللغة',
          trailing: const Text('العربية'),
        ),
        _buildSettingTile(
          icon: Icons.help_outline,
          title: 'المساعدة',
          trailing: const Icon(Icons.chevron_left),
        ),
        _buildSettingTile(
          icon: Icons.logout,
          title: 'تسجيل الخروج',
          textColor: AppColors.error,
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppColors.primary),
      title: Text(
        title,
        style: AppTextStyles.bodyLarge.copyWith(
          color: textColor,
        ),
      ),
      trailing: trailing,
      onTap: () {},
    );
  }
}
