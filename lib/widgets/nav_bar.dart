import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saz_portfolio/theme_controller.dart';
import '../core/theme.dart';
import '../core/constants.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  const NavBar({super.key, required this.scrollController});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _activeIndex = 0;

  void _scrollToSection(int index) {
    setState(() => _activeIndex = index);
    final offset = index * 800.0;
    widget.scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'SAZ',
                      style: GoogleFonts.syne(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                if (!isMobile)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.name,
                        style: GoogleFonts.syne(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                      Text(
                        AppConstants.role,
                        style: GoogleFonts.dmMono(
                          fontSize: 10,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            // Nav Links - hidden on mobile
            if (!isMobile)
              Row(
                children: List.generate(
                  AppConstants.navItems.length,
                  (index) => GestureDetector(
                    onTap: () => _scrollToSection(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: _activeIndex == index
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        AppConstants.navItems[index],
                        style: GoogleFonts.dmSans(
                          fontSize: 13,
                          fontWeight: _activeIndex == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: _activeIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            // Hire Me Button
            Row(
              children: [
                Consumer<ThemeController>(
                  builder: (context, themeController, _) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12), // 👈 ADD THIS
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: themeController.toggleTheme,
                        icon: Icon(
                          themeController.isDark
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          size: 18,
                        ),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 24,
                      vertical: isMobile ? 8 : 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Hire Me',
                    style: GoogleFonts.syne(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
