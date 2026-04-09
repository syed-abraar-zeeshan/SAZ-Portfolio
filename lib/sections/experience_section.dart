import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

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
      'period': 'Sep 2023 – Present',
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
      'period': 'Dec 2022 – Aug 2023',
      'year': '2022 – 2023',
      'points': [
        'Built reusable Flutter widgets with GetX, accelerating feature delivery by 30%.',
        'Reduced UI-related bugs by 25% using MVC-based architecture for better code maintainability.',
        'Consumed RESTful APIs to synchronize backend content ensuring seamless app performance.',
        'Maintained clear documentation and engaged in code reviews for team knowledge sharing.',
      ],
      'tags': ['Flutter', 'GetX', 'REST APIs', 'MVC'],
    },
    {
      'role': 'Associate Software Engineer',
      'company': 'Tech Mahindra',
      'location': 'Hyderabad',
      'period': 'May 2021 – Aug 2022',
      'year': '2021 – 2022',
      'points': [
        'Built Flutter UI screens with focus on widget structure, layout design, and mobile responsiveness.',
        'Collaborated with senior developers to convert Figma designs into functional Flutter interfaces.',
        'Deployed backend services using AWS EC2 and managed cloud storage via Amazon S3.',
        'Delivered tasks in sync with project timelines while balancing learning and execution.',
      ],
      'tags': ['Flutter', 'Figma', 'AWS EC2', 'Amazon S3'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: AppTheme.background,
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
                      'CAREER',
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
                      TextSpan(text: 'Work ', style: AppTheme.displayMedium),
                      TextSpan(
                        text: 'Experience',
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

          // Experience Content
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT - Company List
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FFFE),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.border, width: 0.5),
                  ),
                  child: Column(
                    children: List.generate(
                      experiences.length,
                      (index) => _buildCompanyItem(index),
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // RIGHT - Experience Detail
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildExperienceDetail(
                      experiences[_selectedIndex],
                      key: ValueKey(_selectedIndex),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyItem(int index) {
    final exp = experiences[index];
    final bool isSelected = _selectedIndex == index;
    final bool isLast = index == experiences.length - 1;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryLight : Colors.transparent,
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
              color: isLast ? Colors.transparent : AppTheme.border,
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
                          ? AppTheme.primaryDark
                          : AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    exp['company'] as String,
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    exp['year'] as String,
                    style: GoogleFonts.dmMono(
                      fontSize: 10,
                      color: isSelected ? AppTheme.primary : AppTheme.textMuted,
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

  Widget _buildExperienceDetail(Map<String, dynamic> exp, {required Key key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FFFE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company & Role
          Text(
            '${exp['company']} · ${exp['location']}',
            style: GoogleFonts.dmSans(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            exp['role'] as String,
            style: GoogleFonts.syne(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 10),

          // Period Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppTheme.accent, width: 0.5),
            ),
            child: Text(
              exp['period'] as String,
              style: GoogleFonts.dmMono(
                fontSize: 11,
                color: AppTheme.primaryDark,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Points
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
                        color: AppTheme.textSecondary,
                        height: 1.65,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Tags
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
                      color: AppTheme.primaryLight,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppTheme.accent, width: 0.5),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.dmMono(
                        fontSize: 10,
                        color: AppTheme.primaryDark,
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
