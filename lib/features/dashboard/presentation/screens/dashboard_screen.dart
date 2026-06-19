import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/glass_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 950;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20.w,
          vertical: isDesktop ? 40 : 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Section
            Text(
              "Welcome back, Vijay 👋",
              style: TextStyle(
                fontSize: isDesktop ? 32 : 24.sp,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.white : AppColors.textDark,
              ),
            ).animate().fadeIn().slideX(begin: -0.1, end: 0),
            Text(
              "Here is your professional overview for today.",
              style: TextStyle(
                fontSize: isDesktop ? 16 : 14.sp,
                color: AppColors.grey,
              ),
            ).animate().fadeIn(delay: 200.ms),
            
            const SizedBox(height: 30),

            // 2. Stats Grid (Responsive)
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = isDesktop ? 4 : 2;
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: isDesktop ? 1.8 : 1.2,
                  children: [
                    _buildStatCard('10+', 'Projects', FontAwesomeIcons.code),
                    _buildStatCard('1.5+', 'Years Exp', FontAwesomeIcons.calendarCheck),
                    _buildStatCard('5+', 'Live Apps', FontAwesomeIcons.rocket),
                    _buildStatCard('100%', 'Satisfaction', FontAwesomeIcons.faceSmile),
                  ],
                );
              },
            ),
            
            const SizedBox(height: 40),

            // 3. Two-Column Split Layout for Content
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: _buildMainContent(isDark, isDesktop),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 3,
                    child: _buildQuickActions(isDark, isDesktop),
                  ),
                ],
              )
            else
              Column(
                children: [
                  _buildMainContent(isDark, isDesktop),
                  const SizedBox(height: 30),
                  _buildQuickActions(isDark, isDesktop),
                ],
              ),
            
            if (!isDesktop) SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(bool isDark, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Core Expertise",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.gold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isDesktop ? 2 : 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: [
            _buildExpertiseCard("Flutter Development", "Cross-platform high performance apps.", AppColors.gold, FontAwesomeIcons.flutter),
            _buildExpertiseCard("Backend Integration", "REST & SOAP API expert.", Colors.blue, FontAwesomeIcons.server),
            _buildExpertiseCard("iOS Deployment", "App Store & TestFlight management.", Colors.purple, FontAwesomeIcons.apple),
            _buildExpertiseCard("State Management", "Bloc & Provider architecture.", Colors.green, FontAwesomeIcons.layerGroup),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildQuickActions(bool isDark, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Access",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.white : AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        _buildActionTile("View Resume", FontAwesomeIcons.filePdf, Colors.red),
        const SizedBox(height: 12),
        _buildActionTile("Latest Projects", FontAwesomeIcons.rocket, Colors.blue),
        const SizedBox(height: 12),
        _buildActionTile("Contact Me", FontAwesomeIcons.paperPlane, Colors.green),
      ],
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, color: AppColors.gold, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.grey),
          ),
        ],
      ),
    ).animate().scale(duration: 400.ms);
  }

  Widget _buildExpertiseCard(String title, String subtitle, Color color, IconData icon) {
    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: FaIcon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: AppColors.grey, fontSize: 11), maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon, Color color) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          FaIcon(icon, color: color, size: 18),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const Spacer(),
          const Icon(Icons.chevron_right, size: 18, color: AppColors.grey),
        ],
      ),
    );
  }
}
