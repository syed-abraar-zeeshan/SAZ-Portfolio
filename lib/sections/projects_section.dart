import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'number': '01',
      'name': 'Indipe Payment',
      'type': 'FINTECH · DIGITAL PAYMENTS',
      'desc':
          'A secure digital payment module within the Indipe Wealth app for real-time fund transfers. Merged native Kotlin code via platform channels for seamless Flutter-native interaction.',
      'icon': Icons.credit_card,
      'color': Color(0xFFE1F5EE),
      'iconColor': Color(0xFF1D9E75),
      'tags': ['Flutter', 'Kotlin', 'Firebase', 'BLoC', 'Clean Architecture'],
    },
    {
      'number': '02',
      'name': 'EZIT Guardian',
      'type': 'FINTECH · ASSET TRACKING',
      'desc':
          'A nominee and asset tracking app with real-time financial insights and secure data handling. Applied MVVM architecture and Riverpod for scalable state management.',
      'icon': Icons.shield,
      'color': Color(0xFFE6F1FB),
      'iconColor': Color(0xFF185FA5),
      'tags': ['Flutter', 'Riverpod', 'REST APIs', 'MVVM'],
    },
    {
      'number': '03',
      'name': 'Integra 2.0',
      'type': 'IOT · RENEWABLE ENERGY',
      'desc':
          'A renewable energy monitoring app with live power metrics and analytics. Enabled real-time data visualization via continuous API syncing across Android and iOS.',
      'icon': Icons.bolt,
      'color': Color(0xFFEEEDFE),
      'iconColor': Color(0xFF534AB7),
      'tags': ['Flutter', 'GetX', 'REST APIs', 'MVC'],
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
                      'WHAT I\'VE BUILT',
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
                        text: 'Featured ',
                        style: AppTheme.displayMedium,
                      ),
                      TextSpan(
                        text: 'Projects',
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

          // Projects Grid
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              projects.length,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < projects.length - 1 ? 20 : 0,
                  ),
                  child: FadeInUp(
                    delay: Duration(milliseconds: index * 150),
                    duration: const Duration(milliseconds: 600),
                    child: _ProjectCard(project: projects[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? AppTheme.accent : AppTheme.border,
            width: _hovered ? 1 : 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: widget.project['color'] as Color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      widget.project['icon'] as IconData,
                      size: 48,
                      color: (widget.project['iconColor'] as Color).withOpacity(
                        0.6,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 14,
                    child: Text(
                      widget.project['number'] as String,
                      style: GoogleFonts.syne(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: (widget.project['iconColor'] as Color)
                            .withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Name
                  Text(
                    widget.project['name'] as String,
                    style: GoogleFonts.syne(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Type
                  Text(
                    widget.project['type'] as String,
                    style: GoogleFonts.dmMono(
                      fontSize: 9,
                      color: AppTheme.primary,
                      letterSpacing: 0.08,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    widget.project['desc'] as String,
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tags
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: (widget.project['tags'] as List<String>)
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppTheme.border,
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              tag,
                              style: GoogleFonts.dmMono(
                                fontSize: 9,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
