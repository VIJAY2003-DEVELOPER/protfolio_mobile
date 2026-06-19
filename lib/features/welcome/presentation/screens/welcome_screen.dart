import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../dashboard/presentation/screens/main_navigation.dart';
import 'dart:ui';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDark 
                  ? [AppColors.deepCharcoal, AppColors.black]
                  : [AppColors.white, AppColors.offWhite],
              ),
            ),
          ),
          
          // Floating Gradient Effects
          Positioned(
            top: -100.h,
            right: -100.w,
            child: _buildBlurCircle(AppColors.gold.withOpacity(0.1), 300.w),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: isDesktop 
                  ? _buildDesktopLayout(context)
                  : _buildMobileLayout(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _buildProfileImage().animate().scale(duration: 800.ms, curve: Curves.easeOutBack),
        ),
        SizedBox(width: 60.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildWelcomeContent(context, isDesktop: true),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage().animate().scale(duration: 800.ms, curve: Curves.easeOutBack),
        SizedBox(height: 40.h),
        ..._buildWelcomeContent(context, isDesktop: false),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 250.w,
      width: 250.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gold, width: 4),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withOpacity(0.2),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(AppConstants.profileImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _buildWelcomeContent(BuildContext context, {required bool isDesktop}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textAlign = isDesktop ? TextAlign.left : TextAlign.center;

    return [
      Text(
        'VIJAYSIVAPRAKASH S',
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.white : AppColors.textDark,
          letterSpacing: 1.5,
        ),
      ).animate().fadeIn(duration: 600.ms),
      
      SizedBox(height: 12.h),
      
      Text(
        'Flutter Developer | Mobile App Developer',
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 18.sp,
          color: AppColors.gold,
          fontWeight: FontWeight.w600,
        ),
      ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
      
      SizedBox(height: 24.h),
      
      Text(
        '"Building Beautiful Mobile Experiences with Flutter"',
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 16.sp,
          color: isDark ? AppColors.grey : AppColors.darkGrey,
          fontStyle: FontStyle.italic,
        ),
      ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
      
      SizedBox(height: 48.h),
      
      Wrap(
        spacing: 16.w,
        runSpacing: 16.h,
        alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
        children: [
          _buildActionButton(
            context, 
            'Explore Portfolio', 
            AppColors.gold, 
            AppColors.black,
            () => Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (_) => const MainNavigation())
            ),
          ),
          _buildActionButton(
            context, 
            'Download Resume', 
            Colors.transparent, 
            isDark ? AppColors.white : AppColors.textDark,
            () {},
            isOutlined: true,
          ),
        ],
      ).animate().fadeIn(delay: 600.ms),
    ];
  }

  Widget _buildBlurCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, 
    String text, 
    Color bgColor, 
    Color textColor,
    VoidCallback onPressed,
    {bool isOutlined = false}
  ) {
    return SizedBox(
      width: 200.w,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: 0,
          side: isOutlined ? const BorderSide(color: AppColors.gold, width: 1.5) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
      ),
    );
  }
}
