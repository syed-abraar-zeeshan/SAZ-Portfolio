import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';

class SectionTitle extends StatelessWidget {
  final String tag;
  final String titleNormal;
  final String titleColored;
  final bool isMobile;

  const SectionTitle({
    super.key,
    required this.tag,
    required this.titleNormal,
    required this.titleColored,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 24, height: 1.5, color: AppTheme.primary),
            const SizedBox(width: 8),
            Text(
              tag,
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
                text: '$titleNormal ',
                style: GoogleFonts.syne(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 26 : 40,
                ),
              ),
              TextSpan(
                text: titleColored,
                style: GoogleFonts.syne(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 26 : 40,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
