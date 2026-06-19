import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../widgets/glass_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black : AppColors.offWhite,
      appBar: AppBar(
        title: Text(
          'SETTINGS',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.gold : AppColors.darkGold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            _buildSettingItem(
              context,
              'Dark Mode', 
              isDark ? FontAwesomeIcons.moon : FontAwesomeIcons.sun, 
              isSwitch: true,
              switchValue: isDark,
              onChanged: (v) => themeProvider.toggleTheme(),
            ),
            SizedBox(height: 16.h),
            _buildSettingItem(context, 'Push Notifications', FontAwesomeIcons.bell, isSwitch: true, switchValue: true, onChanged: (v) {}),
            SizedBox(height: 16.h),
            _buildSettingItem(context, 'Language', FontAwesomeIcons.language, isSwitch: false, trailing: 'English'),
            SizedBox(height: 16.h),
            _buildSettingItem(context, 'Version', FontAwesomeIcons.circleInfo, isSwitch: false, trailing: '1.0.0'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String title, 
    IconData icon, 
    {required bool isSwitch, bool? switchValue, ValueChanged<bool>? onChanged, String? trailing}
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      child: Row(
        children: [
          FaIcon(icon, color: AppColors.gold, size: 20.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16.sp, color: isDark ? AppColors.white : AppColors.textDark),
            ),
          ),
          if (isSwitch)
            Switch(
              value: switchValue ?? false,
              onChanged: onChanged,
              activeColor: AppColors.gold,
            )
          else if (trailing != null)
            Text(
              trailing,
              style: TextStyle(fontSize: 14.sp, color: isDark ? AppColors.grey : AppColors.darkGrey),
            ),
        ],
      ),
    );
  }
}
