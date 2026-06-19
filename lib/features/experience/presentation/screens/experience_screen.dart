import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/glass_card.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black : AppColors.offWhite,
      appBar: AppBar(
        title: Text(
          'EXPERIENCE & EDUCATION',
          style: TextStyle(
            fontSize: 24.sp, 
            fontWeight: FontWeight.bold, 
            color: isDark ? AppColors.gold : AppColors.darkGold, 
            letterSpacing: 2
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 60.w : 24.w,
          vertical: 40.h,
        ),
        child: isDesktop 
          ? _buildDesktopLayout(context, isDark)
          : _buildMobileLayout(context, isDark),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Work Experience
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Work History', isDark),
              SizedBox(height: 30.h),
              _buildExperienceTile(
                context,
                'HALCYEN INFO TECHNOLOGY',
                'Flutter Developer',
                'Oct 2025 - Present',
                'Developed G-HRM App (SOAP API), Shree Devarayan Matrimony, and implemented iOS subscription systems (RevenueCat). Lead UI/UX design for enterprise solutions.',
                true,
              ),
              _buildExperienceTile(
                context,
                'TEANSO TECHNOLOGY PVT LTD',
                'Software Engineer',
                'June 2024 - Sept 2025',
                'Focused on Flutter App Development, REST API integration, and performance optimization for various client projects.',
                false,
              ),
            ],
          ),
        ),
        SizedBox(width: 60.w),
        // Right Column: Education
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Education', isDark),
              SizedBox(height: 30.h),
              _buildEducationTile(
                context,
                'K S Rangasamy College of Tech',
                'BE - Electronics & Comm',
                '2020 - 2024',
                'CGPA: 7.52',
              ),
              SizedBox(height: 40.h),
              _buildEducationTile(
                context,
                'Higher Secondary Schooling',
                'Computer Science Group',
                '2018 - 2020',
                'Percentage: 85%',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDark) {
    return Column(
      children: [
        _buildSectionTitle('Work History', isDark),
        SizedBox(height: 24.h),
        _buildExperienceTile(
          context,
          'HALCYEN INFO TECHNOLOGY',
          'Flutter Developer',
          'Oct 2025 - Present',
          'Developed G-HRM App (SOAP API), Shree Devarayan Matrimony, and implemented iOS subscription systems (RevenueCat).',
          true,
        ),
        _buildExperienceTile(
          context,
          'TEANSO TECHNOLOGY PVT LTD',
          'Software Engineer',
          'June 2024 - Sept 2025',
          'Focused on Flutter App Development, REST API integration, and performance optimization.',
          false,
        ),
        
        SizedBox(height: 40.h),
        _buildSectionTitle('Education', isDark),
        SizedBox(height: 24.h),
        
        _buildEducationTile(
          context,
          'K S Rangasamy College of Tech',
          'BE - Electronics & Comm',
          '2020 - 2024',
          'CGPA: 7.52',
        ),
        
        SizedBox(height: 100.h),
      ],
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
    );
  }

  Widget _buildExperienceTile(BuildContext context, String company, String role, String date, String desc, bool isCurrent) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: isCurrent ? AppColors.gold : AppColors.darkGrey,
                  shape: BoxShape.circle,
                  border: Border.all(color: isDark ? AppColors.white : AppColors.black, width: 3),
                  boxShadow: [
                    if (isCurrent)
                      BoxShadow(
                        color: AppColors.gold.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                  ],
                ),
              ),
              Container(
                width: 3.w,
                height: 180.h,
                color: AppColors.darkGrey.withOpacity(0.3),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: GlassCard(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14.sp, 
                      color: AppColors.gold, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 20.sp, 
                      fontWeight: FontWeight.bold, 
                      color: isDark ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 16.sp, 
                      color: isDark ? AppColors.grey : AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 15.sp, 
                      color: isDark ? AppColors.grey : AppColors.textDark, 
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1, end: 0);
  }

  Widget _buildEducationTile(BuildContext context, String inst, String degree, String date, String grade) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: GlassCard(
        padding: EdgeInsets.all(24.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: FaIcon(FontAwesomeIcons.graduationCap, color: AppColors.gold, size: 32.sp),
            ),
            SizedBox(width: 24.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inst, 
                    style: TextStyle(
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.bold, 
                      color: isDark ? AppColors.white : AppColors.textDark,
                    )
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    degree, 
                    style: TextStyle(
                      fontSize: 15.sp, 
                      color: isDark ? AppColors.grey : AppColors.darkGrey,
                    )
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date, 
                        style: const TextStyle(
                          fontSize: 14, 
                          color: AppColors.gold, 
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      Text(
                        grade, 
                        style: TextStyle(
                          fontSize: 16.sp, 
                          color: isDark ? AppColors.white : AppColors.textDark, 
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 400.ms);
  }
}
