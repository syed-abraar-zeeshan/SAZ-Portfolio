import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';
import '../core/constants.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
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
            vertical: isMobile ? 48 : 80,
          ),
          color: Theme.of(context).colorScheme.surface,
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeft(context, isMobile),
                    const SizedBox(height: 40),
                    _buildRight(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildLeft(context, isMobile)),
                    const SizedBox(width: 80),
                    Expanded(flex: 4, child: _buildRight()),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLeft(BuildContext context, bool isMobile) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            tag: "LET'S CONNECT",
            titleNormal: "Let's Build",
            titleColored: 'Something Great.',
            isMobile: isMobile,
          ),
          const SizedBox(height: 20),
          Text(
            "I'm actively looking for Flutter developer roles.\nWhether it's a full-time position, freelance project,\nor just a chat about mobile development — I'd love to connect.",
            style: GoogleFonts.dmSans(
              fontSize: isMobile ? 13 : 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
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
                const SizedBox(width: 10),
                Text(
                  'Available for new opportunities',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () => _launch('mailto:${AppConstants.email}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 36,
                vertical: isMobile ? 14 : 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Send a Message →',
              style: GoogleFonts.syne(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRight() {
    return FadeInRight(
      duration: const Duration(milliseconds: 600),
      child: Column(
        children: [
          _ContactCard(
            icon: Icons.email_outlined,
            label: 'EMAIL',
            value: AppConstants.email,
            color: const Color(0xFFE1F5EE),
            iconColor: AppTheme.primary,
            onTap: () => _launch('mailto:${AppConstants.email}'),
          ),
          const SizedBox(height: 12),
          _ContactCard(
            icon: Icons.work_outline,
            label: 'LINKEDIN',
            value: 'linkedin.com/in/syedabraarzeeshan',
            color: const Color(0xFFE6F1FB),
            iconColor: const Color(0xFF185FA5),
            onTap: () => _launch(AppConstants.linkedin),
          ),
          const SizedBox(height: 12),
          _ContactCard(
            icon: Icons.code,
            label: 'GITHUB',
            value: 'github.com/syedabraarzeeshan',
            color: const Color(0xFFF1EFE8),
            iconColor: const Color(0xFF444441),
            onTap: () => _launch(AppConstants.github),
          ),
          const SizedBox(height: 12),
          _ContactCard(
            icon: Icons.phone_outlined,
            label: 'PHONE',
            value: AppConstants.phone,
            color: const Color(0xFFEAF3DE),
            iconColor: const Color(0xFF3B6D11),
            onTap: () => _launch('tel:${AppConstants.phone}'),
          ),
          const SizedBox(height: 12),
          _ContactCard(
            icon: Icons.location_on_outlined,
            label: 'LOCATION',
            value: AppConstants.location,
            color: const Color(0xFFFAEEDA),
            iconColor: const Color(0xFF854F0B),
            onTap: null,
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? Theme.of(context).colorScheme.primary: Theme.of(context).dividerColor,
              width: _hovered ? 1 : 0.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.dmMono(
                        fontSize: 9,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.value,
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _hovered
                            ? AppTheme.primary
                            : Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (widget.onTap != null)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: _hovered ? AppTheme.primary : Theme.of(context).textTheme.bodySmall!.color,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
