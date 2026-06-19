import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/glass_card.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'GET IN TOUCH',
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
        // Left Column: Branding & Socials
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactHeader(isDark, isDesktop: true),
              SizedBox(height: 60.h),
              Text(
                'Social Networks',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.grey : AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 24.h),
              _buildSocialGrid(isDark, isDesktop: true),
            ],
          ),
        ),
        SizedBox(width: 60.w),
        // Right Column: Contact Cards
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactCard(
                'Email Me',
                'vijaysivaprakash2003@gmail.com',
                FontAwesomeIcons.envelope,
                () => _launchUrl('mailto:vijaysivaprakash2003@gmail.com'),
              ),
              SizedBox(height: 24.h),
              _buildContactCard(
                'Call Me',
                '+91 9344263969',
                FontAwesomeIcons.phone,
                () => _launchUrl('tel:+919344263969'),
              ),
              SizedBox(height: 24.h),
              _buildContactCard(
                'Location',
                'Chennai, Tamil Nadu, India',
                FontAwesomeIcons.locationDot,
                () {},
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
        _buildContactHeader(isDark, isDesktop: false),
        SizedBox(height: 40.h),
        _buildContactCard(
          'Email Me',
          'vijaysivaprakash2003@gmail.com',
          FontAwesomeIcons.envelope,
          () => _launchUrl('mailto:vijaysivaprakash2003@gmail.com'),
        ),
        SizedBox(height: 16.h),
        _buildContactCard(
          'Call Me',
          '+91 9344263969',
          FontAwesomeIcons.phone,
          () => _launchUrl('tel:+919344263969'),
        ),
        SizedBox(height: 40.h),
        Text(
          'Social Networks',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.grey : AppColors.darkGrey,
          ),
        ),
        SizedBox(height: 24.h),
        _buildSocialGrid(isDark, isDesktop: false),
        SizedBox(height: 120.h),
      ],
    );
  }

  Widget _buildContactHeader(bool isDark, {required bool isDesktop}) {
    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gold.withOpacity(0.1),
            border: Border.all(color: AppColors.gold.withOpacity(0.3)),
          ),
          child: FaIcon(FontAwesomeIcons.paperPlane, color: AppColors.gold, size: 56.sp),
        ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
        SizedBox(height: 30.h),
        Text(
          'Let\'s build something amazing together!',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: isDesktop ? 32.sp : 24.sp,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.white : AppColors.textDark,
          ),
        ).animate().fadeIn(delay: 200.ms),
      ],
    );
  }

  Widget _buildContactCard(String title, String value, IconData icon, VoidCallback onTap) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return GestureDetector(
          onTap: onTap,
          child: GlassCard(
            padding: EdgeInsets.all(24.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.gold.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: FaIcon(icon, color: AppColors.gold, size: 28.sp),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, 
                        style: TextStyle(
                          fontSize: 14.sp, 
                          color: isDark ? AppColors.grey : AppColors.darkGrey,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        value, 
                        style: TextStyle(
                          fontSize: 18.sp, 
                          fontWeight: FontWeight.bold, 
                          color: isDark ? AppColors.white : AppColors.textDark,
                        )
                      ),
                    ],
                  ),
                ),
                FaIcon(FontAwesomeIcons.chevronRight, color: AppColors.gold.withOpacity(0.5), size: 18.sp),
              ],
            ),
          ),
        );
      }
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0);
  }

  Widget _buildSocialGrid(bool isDark, {required bool isDesktop}) {
    return Row(
      mainAxisAlignment: isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        _buildSocialButton(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/vijaysivaprakash-s-8152b5292', isDark),
        SizedBox(width: 24.w),
        _buildSocialButton(FontAwesomeIcons.github, 'https://github.com/VIJAY2003-DEVELOPER', isDark),
        SizedBox(width: 24.w),
        _buildSocialButton(FontAwesomeIcons.instagram, 'https://www.instagram.com/itx.__vijay_', isDark),
      ],
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildSocialButton(IconData icon, String url, bool isDark) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.deepCharcoal : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.gold.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FaIcon(icon, color: AppColors.gold, size: 32.sp),
      ),
    );
  }
}
