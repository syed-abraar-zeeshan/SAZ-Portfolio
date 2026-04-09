import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../core/constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: AppTheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT SIDE
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Available Badge
                FadeInDown(
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.accent, width: 0.5),
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
                            fontSize: 11,
                            color: AppTheme.primaryDark,
                            letterSpacing: 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Name
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 600),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Syed Abraar\n',
                          style: AppTheme.displayLarge,
                        ),
                        TextSpan(
                          text: 'Zeeshan',
                          style: AppTheme.displayLarge.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Role Tags
                FadeInDown(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(milliseconds: 600),
                  child: Wrap(
                    spacing: 8,
                    children: [
                      _buildTag('Flutter Developer'),
                      _buildTag('3.5+ Years'),
                      _buildTag('Android · iOS'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Description
                FadeInDown(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 600),
                  child: Text(
                    'Building smooth, high-performance cross-platform apps\nwith Flutter. Specialist in Clean Architecture, BLoC/Riverpod\nstate management, and Kotlin native integrations.',
                    style: AppTheme.bodyLarge,
                  ),
                ),

                const SizedBox(height: 40),

                // Buttons
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 600),
                  child: Row(
                    children: [
                      // Primary Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'View Projects →',
                          style: GoogleFonts.syne(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Secondary Button
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.textPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(color: AppTheme.border, width: 0.5),
                        ),
                        child: Text(
                          'Download Resume',
                          style: GoogleFonts.syne(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          // RIGHT SIDE
          Expanded(
            flex: 4,
            child: FadeInRight(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 700),
              child: Column(
                children: [
                  // Stats Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.8,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildStatCard(AppConstants.yearsExp, 'YEARS EXPERIENCE'),
                      _buildStatCard(AppConstants.appsShipped, 'APPS SHIPPED'),
                      _buildStatCard(AppConstants.companies, 'COMPANIES'),
                      _buildStatCard(AppConstants.onTime, 'ON-TIME DELIVERY'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Impact Metrics
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.border, width: 0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KEY IMPACT METRICS',
                          style: GoogleFonts.dmMono(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textMuted,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildImpactBar(
                          '40%',
                          0.40,
                          'Faster incident resolution',
                        ),
                        const SizedBox(height: 10),
                        _buildImpactBar('30%', 0.30, 'Faster feature delivery'),
                        const SizedBox(height: 10),
                        _buildImpactBar('25%', 0.25, 'Reduced app launch time'),
                        const SizedBox(height: 10),
                        _buildImpactBar('20%', 0.20, 'Improved team velocity'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.accent, width: 0.5),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmMono(fontSize: 11, color: AppTheme.primaryDark),
      ),
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: GoogleFonts.syne(
              fontSize: 28,
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
              color: AppTheme.textMuted,
              letterSpacing: 0.06,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactBar(String percent, double value, String desc) {
    return Row(
      children: [
        SizedBox(
          width: 36,
          child: Text(
            percent,
            style: GoogleFonts.syne(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: AppTheme.border,
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
              minHeight: 5,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 130,
          child: Text(
            desc,
            style: GoogleFonts.dmSans(
              fontSize: 10,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
