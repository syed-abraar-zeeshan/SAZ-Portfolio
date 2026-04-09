import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<Map<String, dynamic>> skills = [
    {
      'icon': Icons.phone_android,
      'title': 'Languages & Frameworks',
      'tags': ['Dart', 'Flutter', 'Kotlin'],
    },
    {
      'icon': Icons.settings,
      'title': 'State Management',
      'tags': ['Riverpod', 'BLoC', 'GetX'],
    },
    {
      'icon': Icons.architecture,
      'title': 'Architecture',
      'tags': ['MVVM', 'MVC', 'Clean Architecture'],
    },
    {
      'icon': Icons.link,
      'title': 'Networking & APIs',
      'tags': ['REST APIs', 'Dio', 'JSON Serialization'],
    },
    {
      'icon': Icons.local_fire_department,
      'title': 'Firebase',
      'tags': ['Auth', 'Firestore', 'Crashlytics'],
    },
    {
      'icon': Icons.storage,
      'title': 'Local Storage',
      'tags': ['Hive', 'SharedPreferences'],
    },
    {
      'icon': Icons.rocket_launch,
      'title': 'DevOps & Deployment',
      'tags': ['GitHub Actions', 'Play Store', 'App Store'],
    },
    {
      'icon': Icons.build,
      'title': 'Advanced Flutter',
      'tags': ['Platform Channels', 'Native Integration', 'Performance Opt.'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: const Color(0xFFF8FFFE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          FadeInDown(
            duration: const Duration(milliseconds: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 24, height: 1.5, color: AppTheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      'WHAT I KNOW',
                      style: GoogleFonts.dmMono(
                        fontSize: 11,
                        color: AppTheme.primary,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Core Skills & ',
                        style: AppTheme.displayMedium,
                      ),
                      TextSpan(
                        text: 'Tech Stack',
                        style: AppTheme.displayMedium.copyWith(
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Skills Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.4,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return FadeInUp(
                delay: Duration(milliseconds: index * 100),
                duration: const Duration(milliseconds: 500),
                child: _SkillCard(skill: skills[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovered ? AppTheme.primaryLight : AppTheme.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppTheme.accent : AppTheme.border,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Icon(
              widget.skill['icon'] as IconData,
              color: _hovered ? AppTheme.primary : AppTheme.textMuted,
              size: 22,
            ),
            const SizedBox(height: 10),

            // Title
            Text(
              widget.skill['title'] as String,
              style: GoogleFonts.syne(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),

            // Tags
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: (widget.skill['tags'] as List<String>)
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: _hovered
                            ? Colors.white
                            : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: _hovered ? AppTheme.accent : AppTheme.border,
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.dmMono(
                          fontSize: 9,
                          color: _hovered
                              ? AppTheme.primaryDark
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
