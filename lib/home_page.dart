import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(scrollController: _scrollController),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const HeroSection(),
                  const SkillsSection(),
                  const ExperienceSection(),
                  const ProjectsSection(),
                  const ContactSection(),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '© 2025 Syed Abraar Zeeshan',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Built with Flutter Web ⚡',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: AppTheme.primary,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2025 Syed Abraar Zeeshan · Hyderabad, India',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
                Text(
                  'Built with Flutter Web ⚡',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: AppTheme.primary,
                  ),
                ),
              ],
            ),
    );
  }
}
