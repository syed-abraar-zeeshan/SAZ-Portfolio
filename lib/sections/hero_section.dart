import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saz_portfolio/core/constants.dart';
import 'package:saz_portfolio/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _downloadResume() async {
    final url = Uri.parse('/assets/resume/Resume.pdf');

    if (!await launchUrl(
      url,
      webOnlyWindowName: '_blank', // opens in new tab
    )) {
      throw Exception('Could not open resume');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 40 : 80,
          ),
          color: Theme.of(context).colorScheme.surface,
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeft(context, isMobile),
                    const SizedBox(height: 40),
                    _buildRight(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildLeft(context, isMobile)),
                    const SizedBox(width: 60),
                    Expanded(flex: 4, child: _buildRight(context)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLeft(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF16A34A),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Open to work · ${AppConstants.location}',
                  style: GoogleFonts.dmMono(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 600),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Syed Abraar\n',
                  style: GoogleFonts.syne(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontWeight: FontWeight.w800,
                    fontSize: isMobile ? 34 : 56,
                  ),
                ),
                TextSpan(
                  text: 'Zeeshan',
                  style: GoogleFonts.syne(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontWeight: FontWeight.w800,
                    fontSize: isMobile ? 34 : 56,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        FadeInDown(
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _buildTag(context, 'Flutter Developer'),
              _buildTag(context, '3.5+ Years'),
              _buildTag(context, 'Android · iOS'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        FadeInDown(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 600),
          child: Text(
            'Building smooth, high-performance cross-platform apps with Flutter. Specialist in Clean Architecture, BLoC/Riverpod state management, and Kotlin native integrations.',
            style: GoogleFonts.dmSans(
              fontSize: isMobile ? 13 : 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 32),
        FadeInUp(
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 32,
                    vertical: isMobile ? 14 : 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'View Projects →',
                  style: GoogleFonts.syne(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: _downloadResume,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).textTheme.bodyLarge!.color,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 32,
                    vertical: isMobile ? 14 : 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  'Download Resume',
                  style: GoogleFonts.syne(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.8,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildStatCard(context, AppConstants.yearsExp, 'YEARS EXPERIENCE'),
            _buildStatCard(context, AppConstants.appsShipped, 'APPS SHIPPED'),
            _buildStatCard(context, AppConstants.companies, 'COMPANIES'),
            _buildStatCard(context, AppConstants.onTime, 'ON-TIME DELIVERY'),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmMono(
          fontSize: 10,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String number, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: GoogleFonts.syne(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppTheme.primary,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.dmMono(
              fontSize: 9,
              color: Theme.of(context).textTheme.bodySmall!.color,
              letterSpacing: 0.06,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildImpactBar(String percent, double value, String desc) {
  //   return Row(
  //     children: [
  //       SizedBox(
  //         width: 36,
  //         child: Text(
  //           percent,
  //           style: GoogleFonts.syne(
  //             fontSize: 12,
  //             fontWeight: FontWeight.w700,
  //             color: AppTheme.primary,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 10),
  //       Expanded(
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(3),
  //           child: LinearProgressIndicator(
  //             value: value,
  //             backgroundColor: Theme.of(context).dividerColor,
  //             valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
  //             minHeight: 5,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 10),
  //       SizedBox(
  //         width: 110,
  //         child: Text(
  //           desc,
  //           style: GoogleFonts.dmSans(
  //             fontSize: 10,
  //             color: Theme.of(context).textTheme.bodySmall!.color,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
