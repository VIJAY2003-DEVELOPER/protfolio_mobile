import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/glass_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'PROJECTS',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.gold : AppColors.darkGold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 60.w : 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Featured Works', isDark),
            SizedBox(height: 24.h),
            
            isDesktop 
              ? _buildDesktopFeaturedGrid(context)
              : _buildMobileFeaturedCarousel(context),
            
            SizedBox(height: 60.h),
            _buildSectionTitle('Mini Projects', isDark),
            SizedBox(height: 24.h),
            
            _buildMiniProjectsLayout(isDesktop, isTablet, isDark),
            
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.white : AppColors.textDark,
      ),
    ).animate().fadeIn().slideX(begin: -0.2, end: 0);
  }

  Widget _buildDesktopFeaturedGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 30.h,
      crossAxisSpacing: 30.w,
      childAspectRatio: 1.1,
      children: [
        _buildProjectCard(
          context,
          'MedizinHub',
          'Healthcare E-Commerce',
          'Flutter, Firebase, Bloc',
          'https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&q=80&w=500',
        ),
        _buildProjectCard(
          context,
          'My Prop AI',
          'Real Estate Platform',
          'Flutter, Google Maps, AI',
          'https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&q=80&w=500',
        ),
        _buildProjectCard(
          context,
          'G-HRM App',
          'HR Management System',
          'Flutter, SOAP, XML',
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=500',
        ),
      ],
    );
  }

  Widget _buildMobileFeaturedCarousel(BuildContext context) {
    return SizedBox(
      height: 420.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProjectCard(
            context,
            'MedizinHub',
            'Healthcare E-Commerce',
            'Flutter, Firebase, Bloc',
            'https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&q=80&w=500',
            width: 320.w,
          ),
          SizedBox(width: 20.w),
          _buildProjectCard(
            context,
            'My Prop AI',
            'Real Estate Platform',
            'Flutter, Google Maps, AI',
            'https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&q=80&w=500',
            width: 320.w,
          ),
          SizedBox(width: 20.w),
          _buildProjectCard(
            context,
            'G-HRM App',
            'HR Management System',
            'Flutter, SOAP, XML',
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=500',
            width: 320.w,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, 
    String title, 
    String category, 
    String tech, 
    String imageUrl,
    {double? width}
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: GlassCard(
        padding: EdgeInsets.zero,
        borderRadius: 24.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isDark ? AppColors.gold : AppColors.darkGold,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.white : AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      tech,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isDark ? AppColors.grey : AppColors.darkGrey,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _buildProjectAction(FontAwesomeIcons.github),
                        SizedBox(width: 16.w),
                        _buildProjectAction(FontAwesomeIcons.arrowUpRightFromSquare),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }

  Widget _buildProjectAction(IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: FaIcon(icon, color: AppColors.gold, size: 18.sp),
    );
  }

  Widget _buildMiniProjectsLayout(bool isDesktop, bool isTablet, bool isDark) {
    if (isDesktop || isTablet) {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: isDesktop ? 3 : 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 2.2,
        children: [
          _buildMiniProjectItem('Call Log App', 'System utility for call tracking', 'Flutter', isDark),
          _buildMiniProjectItem('Weather App', 'Real-time weather forecasting', 'Flutter, OpenWeather', isDark),
          _buildMiniProjectItem('Portfolio App', 'This premium portfolio system', 'Flutter, Animations', isDark),
        ],
      );
    } else {
      return Column(
        children: [
          _buildMiniProjectItem('Call Log App', 'System utility for call tracking', 'Flutter', isDark),
          _buildMiniProjectItem('Weather App', 'Real-time weather forecasting', 'Flutter, OpenWeather', isDark),
          _buildMiniProjectItem('Portfolio App', 'This premium portfolio system', 'Flutter, Animations', isDark),
        ],
      );
    }
  }

  Widget _buildMiniProjectItem(String title, String desc, String tech, bool isDark) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: GlassCard(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.charcoal : AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: FaIcon(FontAwesomeIcons.folderOpen, color: AppColors.gold, size: 24.sp),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isDark ? AppColors.grey : AppColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    tech,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0);
  }
}
