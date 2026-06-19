import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../welcome/presentation/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const WelcomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black : AppColors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: isDark 
              ? [AppColors.deepCharcoal, AppColors.black]
              : [AppColors.white, AppColors.softGrey],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Logo
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.gold, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Text(
                'VS',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                  letterSpacing: 2,
                ),
              ),
            )
                .animate()
                .scale(duration: 1000.ms, curve: Curves.elasticOut)
                .shimmer(delay: 1500.ms, duration: 1500.ms, color: AppColors.white),
            
            SizedBox(height: 30.h),
            
            // Branding Text
            Text(
              'VIJAYSIVAPRAKASH S',
              style: TextStyle(
                fontSize: 18.sp,
                color: isDark ? AppColors.white : AppColors.textDark,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            )
                .animate()
                .fadeIn(delay: 500.ms, duration: 800.ms)
                .slideY(begin: 0.5, end: 0),
            
            SizedBox(height: 10.h),
            
            Text(
              'PREMIUM PORTFOLIO',
              style: TextStyle(
                fontSize: 12.sp,
                color: isDark ? AppColors.gold : AppColors.darkGold,
                letterSpacing: 2,
              ),
            )
                .animate()
                .fadeIn(delay: 1000.ms, duration: 800.ms),
          ],
        ),
      ),
    );
  }
}
