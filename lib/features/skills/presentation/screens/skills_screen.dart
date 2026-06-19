import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'SKILLS & TECH',
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
            if (isDesktop) 
              _buildDesktopSkills(isDark)
            else 
              _buildMobileSkills(isDark),
            
            SizedBox(height: 60.h),
            _buildSectionTitle('iOS Ecosystem', isDark),
            SizedBox(height: 24.h),
            
            isDesktop 
              ? _buildDesktopIOSSkills(isDark)
              : _buildMobileIOSSkills(isDark),

            SizedBox(height: 60.h),
            _buildSectionTitle('Tools & Environment', isDark),
            SizedBox(height: 24.h),
            
            _buildToolsGrid(isDark),
            
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopSkills(bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Mobile Development', isDark),
              SizedBox(height: 24.h),
              _buildSkillItem('Flutter', 0.95, isDark),
              _buildSkillItem('Dart', 0.90, isDark),
              _buildSkillItem('Responsive Design', 0.95, isDark),
            ],
          ),
        ),
        SizedBox(width: 60.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Backend & Integration', isDark),
              SizedBox(height: 24.h),
              _buildSkillItem('REST API', 0.95, isDark),
              _buildSkillItem('SOAP API / XML', 0.90, isDark),
              _buildSkillItem('Firebase', 0.90, isDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSkills(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Mobile Development', isDark),
        SizedBox(height: 16.h),
        _buildSkillItem('Flutter', 0.95, isDark),
        _buildSkillItem('Dart', 0.90, isDark),
        _buildSkillItem('Responsive Design', 0.95, isDark),
        SizedBox(height: 30.h),
        _buildSectionTitle('Backend & Integration', isDark),
        SizedBox(height: 16.h),
        _buildSkillItem('REST API', 0.95, isDark),
        _buildSkillItem('SOAP API / XML', 0.90, isDark),
        _buildSkillItem('Firebase', 0.90, isDark),
      ],
    );
  }

  Widget _buildDesktopIOSSkills(bool isDark) {
    return Row(
      children: [
        Expanded(child: _buildSkillItem('Xcode / TestFlight', 0.85, isDark)),
        SizedBox(width: 40.w),
        Expanded(child: _buildSkillItem('RevenueCat / Subscriptions', 0.90, isDark)),
        SizedBox(width: 40.w),
        Expanded(child: _buildSkillItem('App Store Connect', 0.85, isDark)),
      ],
    );
  }

  Widget _buildMobileIOSSkills(bool isDark) {
    return Column(
      children: [
        _buildSkillItem('Xcode / TestFlight', 0.85, isDark),
        _buildSkillItem('RevenueCat / Subscriptions', 0.90, isDark),
        _buildSkillItem('App Store Connect', 0.85, isDark),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.white : AppColors.textDark,
      ),
    ).animate().fadeIn().slideX(begin: -0.1, end: 0);
  }

  Widget _buildSkillItem(String name, double percentage, bool isDark) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name, 
                style: TextStyle(
                  color: isDark ? AppColors.grey : AppColors.darkGrey, 
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                )
              ),
              Text(
                '${(percentage * 100).toInt()}%', 
                style: TextStyle(
                  color: isDark ? AppColors.gold : AppColors.darkGold, 
                  fontSize: 16.sp, 
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Stack(
            children: [
              Container(
                height: 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.charcoal : AppColors.softGrey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 10.h,
                    width: constraints.maxWidth * percentage,
                    decoration: BoxDecoration(
                      gradient: AppColors.goldGradient,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gold.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ).animate().shimmer(duration: 2000.ms);
                },
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms);
  }

  Widget _buildToolsGrid(bool isDark) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.h,
      children: [
        _buildToolChip('VS Code', isDark),
        _buildToolChip('Android Studio', isDark),
        _buildToolChip('Postman', isDark),
        _buildToolChip('GitHub', isDark),
        _buildToolChip('Figma', isDark),
        _buildToolChip('Slack', isDark),
        _buildToolChip('Jira', isDark),
      ],
    );
  }

  Widget _buildToolChip(String label, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.deepCharcoal : AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDark ? AppColors.white : AppColors.textDark,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    ).animate().scale(delay: 300.ms);
  }
}
