import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../widgets/section_title.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        int columns = 4;
        if (constraints.maxWidth < 500) {
          columns = 1;
        } else if (constraints.maxWidth < 700) {
          columns = 2;
        } else if (constraints.maxWidth < 1000) {
          columns = 3;
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 48 : 80,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 600),
                child: SectionTitle(
                  tag: 'WHAT I KNOW',
                  titleNormal: 'Core Skills &',
                  titleColored: 'Tech Stack',
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: columns == 1 ? 2.2 : 1.5,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                    delay: Duration(milliseconds: index * 80),
                    duration: const Duration(milliseconds: 500),
                    child: _SkillCard(skill: skills[index]),
                  );
                },
              ),
            ],
          ),
        );
      },
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _hovered
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
            width: 0.5,
          ),
          boxShadow: [
            if (Theme.of(context).brightness == Brightness.dark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.skill['icon'] as IconData,
              color: _hovered
                  ? AppTheme.primary
                  : Theme.of(context).textTheme.bodySmall!.color,
              size: 20,
            ),
            const SizedBox(height: 8),
            Text(
              widget.skill['title'] as String,
              style: GoogleFonts.syne(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: (widget.skill['tags'] as List<String>)
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: _hovered
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.surface.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: _hovered
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).dividerColor,
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.dmMono(
                          fontSize: 9,
                          color: _hovered
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.bodyMedium!.color,
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
