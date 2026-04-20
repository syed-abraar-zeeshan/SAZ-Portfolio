import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _selectedIndex = 0;

  static const List<Map<String, dynamic>> experiences = [
    {
      'role': 'Flutter Developer',
      'company': 'Vrinda Techapps',
      'location': 'Hyderabad',
      'period': 'September 2023 – Present',
      'year': '2023 – Now',
      'points': [
        'Developed and deployed 3 cross-platform mobile apps, increasing customer retention through intuitive UI.',
        'Reduced UI/UX iteration cycles by 20% through close collaboration with designers and QA teams.',
        'Integrated Firebase Crashlytics for proactive monitoring, cutting incident resolution time by 40%.',
        'Maintained 100% on-time sprint delivery through strong Agile coordination.',
      ],
      'tags': ['Flutter', 'Firebase', 'BLoC', 'Clean Architecture', 'Agile'],
    },
    {
      'role': 'Software Developer',
      'company': 'BitsSens Technologies',
      'location': 'Hyderabad',
      'period': 'January 2023 – August 2023',
      'year': '2022 – 2023',
      'points': [
        'Built reusable Flutter widgets with GetX, accelerating feature delivery by 30%.',
        'Reduced UI-related bugs by 25% using MVC-based architecture.',
        'Consumed RESTful APIs to synchronize backend content ensuring seamless app performance.',
        'Maintained clear documentation and engaged in code reviews for knowledge sharing.',
      ],
      'tags': ['Flutter', 'GetX', 'REST APIs', 'MVC'],
    },
    {
      'role': 'Associate Software Engineer',
      'company': 'Tech Mahindra',
      'location': 'Hyderabad',
      'period': 'July 2021 – August 2022',
      'year': '2021 – 2022',
      'points': [
        'Built Flutter UI screens with focus on widget structure, layout design, and responsiveness.',
        'Collaborated with senior developers to convert Figma designs into Flutter interfaces.',
        'Deployed backend services using AWS EC2 and managed cloud storage via Amazon S3.',
        'Delivered tasks in sync with project timelines while balancing learning and execution.',
      ],
      'tags': ['Flutter', 'Figma', 'AWS EC2', 'Amazon S3'],
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
              FadeInDown(
                duration: const Duration(milliseconds: 600),
                child: SectionTitle(
                  tag: 'CAREER',
                  titleNormal: 'Work',
                  titleColored: 'Experience',
                  isMobile: isMobile,
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                experiences.length,
                                (index) => _buildMobileTab(index),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _buildDetail(
                              experiences[_selectedIndex],
                              key: ValueKey(_selectedIndex),
                              isMobile: true,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 240,
                            decoration: BoxDecoration(
                               color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                                width: 0.5,
                              ),

                            ),
                            child: Column(
                              children: List.generate(
                                experiences.length,
                                (index) => _buildSidebarItem(index),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: _buildDetail(
                                experiences[_selectedIndex],
                                key: ValueKey(_selectedIndex),
                                isMobile: false,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileTab(int index) {
    final exp = experiences[index];
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8, bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary.withValues(alpha:0.1) : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppTheme.primary : Theme.of(context).dividerColor,
            width: isSelected ? 1 : 0.5,
          ),
        ),
        child: Text(
          exp['company'] as String,
          style: GoogleFonts.syne(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarItem(int index) {
    final exp = experiences[index];
    final bool isSelected = _selectedIndex == index;
    final bool isLast = index == experiences.length - 1;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: index == 0 ? const Radius.circular(12) : Radius.zero,
            bottom: isLast ? const Radius.circular(12) : Radius.zero,
          ),
          border: Border(
            left: BorderSide(
              color: isSelected ? AppTheme.primary : Colors.transparent,
              width: 3,
            ),
            bottom: BorderSide(
              color: isLast ? Colors.transparent : Theme.of(context).dividerColor,
              width: 0.5,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp['role'] as String,
                    style: GoogleFonts.syne(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    exp['company'] as String,
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    exp['year'] as String,
                    style: GoogleFonts.dmMono(
                      fontSize: 10,
                      color: isSelected ? AppTheme.primary : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.arrow_forward_ios, size: 12, color: AppTheme.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(
    Map<String, dynamic> exp, {
    required Key key,
    required bool isMobile,
  }) {
    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
         color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.dark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${exp['company']} · ${exp['location']}',
            style: GoogleFonts.dmSans(
              fontSize: 13,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            exp['role'] as String,
            style: GoogleFonts.syne(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
            ),
            child: Text(
              exp['period'] as String,
              style: GoogleFonts.dmMono(
                fontSize: 11,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            (exp['points'] as List<String>).length,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      (exp['points'] as List<String>)[i],
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        height: 1.65,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: (exp['tags'] as List<String>)
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha:0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.dmMono(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
