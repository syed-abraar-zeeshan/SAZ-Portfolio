import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme.dart';
import '../core/constants.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: AppTheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT
          Expanded(
            flex: 5,
            child: FadeInLeft(
              duration: const Duration(milliseconds: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 1.5,
                        color: AppTheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'LET\'S CONNECT',
                        style: GoogleFonts.dmMono(
                          fontSize: 11,
                          color: AppTheme.primary,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Heading
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Let\'s Build\n',
                          style: AppTheme.displayMedium,
                        ),
                        TextSpan(
                          text: 'Something Great.',
                          style: AppTheme.displayMedium.copyWith(
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  Text(
                    'I\'m actively looking for Flutter developer roles.\nWhether it\'s a full-time position, freelance project,\nor just a chat about mobile development — I\'d love to connect.',
                    style: AppTheme.bodyLarge,
                  ),

                  const SizedBox(height: 40),

                  // Availability Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryLight,
                      borderRadius: BorderRadius.circular(8),
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
                        const SizedBox(width: 10),
                        Text(
                          'Available for new opportunities',
                          style: GoogleFonts.dmMono(
                            fontSize: 12,
                            color: AppTheme.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Send Message Button
                  ElevatedButton(
                    onPressed: () => _launch('mailto:${AppConstants.email}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Send a Message →',
                      style: GoogleFonts.syne(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 80),

          // RIGHT
          Expanded(
            flex: 4,
            child: FadeInRight(
              duration: const Duration(milliseconds: 600),
              child: Column(
                children: [
                  _buildContactCard(
                    icon: Icons.email_outlined,
                    label: 'EMAIL',
                    value: AppConstants.email,
                    color: const Color(0xFFE1F5EE),
                    iconColor: AppTheme.primary,
                    onTap: () => _launch('mailto:${AppConstants.email}'),
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    icon: Icons.work_outline,
                    label: 'LINKEDIN',
                    value: 'linkedin.com/in/syedabraarzeeshan',
                    color: const Color(0xFFE6F1FB),
                    iconColor: const Color(0xFF185FA5),
                    onTap: () => _launch(AppConstants.linkedin),
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    icon: Icons.phone_outlined,
                    label: 'PHONE',
                    value: AppConstants.phone,
                    color: const Color(0xFFEAF3DE),
                    iconColor: const Color(0xFF3B6D11),
                    onTap: () => _launch('tel:${AppConstants.phone}'),
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    icon: Icons.location_on_outlined,
                    label: 'LOCATION',
                    value: AppConstants.location,
                    color: const Color(0xFFF1EFE8),
                    iconColor: const Color(0xFF5F5E5A),
                    onTap: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color iconColor,
    required VoidCallback? onTap,
  }) {
    return _HoverContactCard(
      icon: icon,
      label: label,
      value: value,
      color: color,
      iconColor: iconColor,
      onTap: onTap,
    );
  }
}

class _HoverContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Color iconColor;
  final VoidCallback? onTap;

  const _HoverContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  State<_HoverContactCard> createState() => _HoverContactCardState();
}

class _HoverContactCardState extends State<_HoverContactCard> {
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
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? AppTheme.accent : AppTheme.border,
              width: _hovered ? 1 : 0.5,
            ),
          ),
          child: Row(
            children: [
              // Icon Box
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

              // Label + Value
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.dmMono(
                        fontSize: 9,
                        color: AppTheme.textMuted,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.value,
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _hovered
                            ? AppTheme.primary
                            : AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              if (widget.onTap != null)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: _hovered ? AppTheme.primary : AppTheme.textMuted,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
