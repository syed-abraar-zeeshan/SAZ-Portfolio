import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'number': '01',
      'name': 'NowVision',
      'type': 'CONSTRUCTION · SITE INSPECTION',
      'desc':
          'Built end-to-end inspection and site reporting flows using GetX, enabling real-time upload of images, panoramas, and location data from construction sites into the NowVision AI platform.',
      'icon': Icons.camera_outdoor,
      'color': Color(0xFFE1F5EE),
      'iconColor': Color(0xFF1D9E75),
      'tags': ['Flutter', 'GetX', 'MVC', 'Clean Architecture'],
    },
    {
      'number': '02',
      'name': 'Indipe Payment',
      'type': 'FINTECH · DIGITAL PAYMENTS',
      'desc':
          'Secure real-time payment transfers via Flutter-Kotlin integration. Created reusable payment modules integrated into multiple apps. Increased maintainability by 25% using BLoC and Clean Architecture.',
      'icon': Icons.credit_card,
      'color': Color(0xFFE6F1FB),
      'iconColor': Color(0xFF185FA5),
      'tags': ['Flutter', 'Kotlin', 'BLoC', 'Clean Architecture'],
    },
    {
      'number': '03',
      'name': 'EZIT Guardian',
      'type': 'FINTECH · ASSET TRACKING',
      'desc':
          'Real-time nominee and asset tracking with enhanced data security. Improved data fetch success by 25% via advanced error handling, retry logic, and offline caching using Hive.',
      'icon': Icons.shield,
      'color': Color(0xFFEEEDFE),
      'iconColor': Color(0xFF534AB7),
      'tags': ['Flutter', 'Riverpod', 'REST APIs', 'MVVM', 'Hive'],
    },
    {
      'number': '04',
      'name': 'Integra Global',
      'type': 'IOT · RENEWABLE ENERGY',
      'desc':
          'Renewable energy monitoring with real-time analytics via SignalR. Reduced data latency by 30% through API optimization and efficient state management across Android and iOS.',
      'icon': Icons.bolt,
      'color': Color(0xFFFAEEDA),
      'iconColor': Color(0xFF854F0B),
      'tags': ['Flutter', 'GetX', 'REST APIs', 'MVC', 'SignalR'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
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
              // Section Title
              FadeInDown(
                duration: const Duration(milliseconds: 600),
                child: SectionTitle(
                  tag: "WHAT I'VE BUILT",
                  titleNormal: 'Featured',
                  titleColored: 'Projects',
                  isMobile: isMobile,
                ),
              ),

              const SizedBox(height: 40),

              // ── PROJECT CARDS LAYOUT ──
              if (isMobile)
                // Mobile: single column
                Column(
                  children: List.generate(
                    projects.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FadeInUp(
                        delay: Duration(milliseconds: index * 100),
                        duration: const Duration(milliseconds: 600),
                        child: _ProjectCard(project: projects[index]),
                      ),
                    ),
                  ),
                )
              else
                // Desktop: 2x2 grid
                Column(
                  children: [
                    // Row 1 — Project 01 & 02
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 0),
                              duration: const Duration(milliseconds: 600),
                              child: _ProjectCard(project: projects[0]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 100),
                              duration: const Duration(milliseconds: 600),
                              child: _ProjectCard(project: projects[1]),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Row 2 — Project 03 & 04
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 200),
                              duration: const Duration(milliseconds: 600),
                              child: _ProjectCard(project: projects[2]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 300),
                              duration: const Duration(milliseconds: 600),
                              child: _ProjectCard(project: projects[3]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        );
      },
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
    final baseColor = widget.project['color'] as Color;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
            width: _hovered ? 1 : 0.5,
          ),
          boxShadow: [
            if (Theme.of(context).brightness == Brightness.dark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              height: 110,

              decoration: BoxDecoration(
                gradient: Theme.of(context).brightness == Brightness.dark
                    ? LinearGradient(
                        colors: [
                          baseColor.withValues(alpha: 0.18),
                          baseColor.withValues(alpha: 0.05),
                        ],
                      )
                    : null,
                color: Theme.of(context).brightness == Brightness.dark
                    ? null
                    : baseColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      widget.project['icon'] as IconData,
                      size: 44,
                      color: (widget.project['iconColor'] as Color).withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 12,
                    child: Text(
                      widget.project['number'] as String,
                      style: GoogleFonts.syne(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: (widget.project['iconColor'] as Color)
                            .withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project['name'] as String,
                    style: GoogleFonts.syne(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.project['type'] as String,
                    style: GoogleFonts.dmMono(
                      fontSize: 9,
                      color: AppTheme.primary,
                      letterSpacing: 0.08,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project['desc'] as String,
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 14),
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
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.12)
                                  : const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              tag,
                              style: GoogleFonts.dmMono(
                                fontSize: 9,
                                color: Theme.of(context).colorScheme.primary,
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
