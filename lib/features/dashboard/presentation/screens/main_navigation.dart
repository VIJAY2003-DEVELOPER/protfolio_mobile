import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../widgets/desktop_sidebar.dart';
import 'dashboard_screen.dart';
import '../../../projects/presentation/screens/projects_screen.dart';
import '../../../skills/presentation/screens/skills_screen.dart';
import '../../../contact/presentation/screens/contact_screen.dart';
import '../../../experience/presentation/screens/experience_screen.dart';
import '../../../resume/presentation/screens/resume_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ProjectsScreen(),
    const SkillsScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 950; // Using the breakpoint from your reference code
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black : const Color(0xFFF8FAFF),
      endDrawer: isDesktop ? null : _buildDrawer(context),
      body: Row(
        children: [
          if (isDesktop)
            DesktopSidebar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
            ),
          Expanded(
            child: Column(
              children: [
                if (isDesktop) _buildDesktopAppBar(context, isDark),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: _screens,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop ? null : _buildBottomNavBar(isDark),
      extendBody: true,
    );
  }

  Widget _buildDesktopAppBar(BuildContext context, bool isDark) {
    String title = "Home";
    switch (_selectedIndex) {
      case 0: title = "Dashboard"; break;
      case 1: title = "Projects"; break;
      case 2: title = "Skills & Technology"; break;
      case 3: title = "Contact Me"; break;
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.1), width: 1)),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.white : AppColors.textDark,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.clockRotateLeft, size: 20),
            color: AppColors.gold,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExperienceScreen())),
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.gear, size: 20),
            color: AppColors.gold,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
          ),
          const SizedBox(width: 20),
          VerticalDivider(indent: 25, endIndent: 25, color: AppColors.gold.withOpacity(0.2)),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ResumeScreen())),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gold),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Resume",
                style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(bool isDark) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.charcoal : AppColors.white).withOpacity(0.95),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.gold.withOpacity(0.3), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.gold,
          unselectedItemColor: isDark ? AppColors.grey : AppColors.darkGrey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.briefcase), label: 'Projects'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bolt), label: 'Skills'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.envelope), label: 'Contact'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      backgroundColor: isDark ? AppColors.black : AppColors.offWhite,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: isDark ? AppColors.charcoal : AppColors.white),
            currentAccountPicture: CircleAvatar(
              backgroundImage: const NetworkImage(AppConstants.profileImageUrl),
            ),
            accountName: Text('VIJAYSIVAPRAKASH S', style: TextStyle(color: isDark ? AppColors.gold : AppColors.darkGold, fontWeight: FontWeight.bold)),
            accountEmail: const Text('vijaysivaprakash2003@gmail.com'),
          ),
          _buildDrawerItem(context, 'Experience', FontAwesomeIcons.timeline, const ExperienceScreen()),
          _buildDrawerItem(context, 'Resume', FontAwesomeIcons.fileLines, const ResumeScreen()),
          _buildDrawerItem(context, 'Settings', FontAwesomeIcons.gear, const SettingsScreen()),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget screen) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: FaIcon(icon, color: AppColors.gold, size: 20.sp),
      title: Text(title, style: TextStyle(color: isDark ? AppColors.white : AppColors.textDark, fontSize: 16.sp)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}
