import 'package:eddie_the_dev_frontend/core/constants/app_svgs.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/repo/user_info_repo.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isVertical() ? _vLayout(context) : _hLayout(context);
  }

  void _sendMessage(name, email, message) {
    final firebaseService = FirebaseService();
    final userInfoRepo = UserInfoRepo(firebaseService: firebaseService);
    userInfoRepo.saveContactMessage(
      name: name,
      email: email,
      message: message,
    );
  }

  Widget _vLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(),
          const SizedBox(height: 32),
          _SocialLinks(),
          const SizedBox(height: 32),
          _Divider(),
          const SizedBox(height: 32),
          _ContactForm(onSubmit: _sendMessage),
        ],
      ),
    );
  }

  Widget _hLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(),
          const SizedBox(height: 48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.screenWidth() * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LeftBlurb(),
                    const SizedBox(height: 32),
                    _SocialLinks(),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: _ContactForm(onSubmit: _sendMessage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 8),
        Text(
          'Have a project in mind or want to work together? Let\'s talk.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}

class _LeftBlurb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's build\nsomething great.",
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 26,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m currently open to full-time Flutter roles and select freelance projects. '
          'Response time is usually within 24 hours.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            height: 1.7,
            color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 24),
        _ContactInfoRow(
          icon: Icons.location_on_outlined,
          label: profileData.location,
        ),
        const SizedBox(height: 10),
        _ContactInfoRow(
          icon: Icons.mail_outline_rounded,
          label: profileData.email,
        ),
      ],
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactInfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.primary),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: context.isDark ? AppColors.darkBorder : AppColors.lightBorder,
    );
  }
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final links = [
      _SocialItem(
        label: 'Email',
        sublabel: profileData.email,
        svgIcon: AppSvgs.email,
        url: 'mailto:${profileData.email}',
      ),
      _SocialItem(
        label: 'LinkedIn',
        sublabel: 'kyaw-phyoe-han',
        svgIcon: AppSvgs.linkedIn,
        url: 'https://linkedin.com/in/kyaw-phyoe-han-aba3b9255',
      ),
      _SocialItem(
        label: 'GitHub',
        sublabel: 'walkmandede',
        svgIcon: AppSvgs.github,
        url: 'https://github.com/walkmandede',
      ),
      _SocialItem(
        label: 'WhatsApp',
        sublabel: '+66 62 705 2637',
        svgIcon: AppSvgs.whatsapp,
        url: 'https://wa.me/66627052637',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: links
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SocialCard(item: item),
            ),
          )
          .toList(),
    );
  }
}

class _SocialItem {
  final String label;
  final String sublabel;
  final String svgIcon;
  final String url;

  const _SocialItem({
    required this.label,
    required this.sublabel,
    required this.svgIcon,
    required this.url,
  });
}

class _SocialCard extends StatefulWidget {
  final _SocialItem item;

  const _SocialCard({required this.item});

  @override
  State<_SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<_SocialCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.item.url);
          if (await canLaunchUrl(uri)) launchUrl(uri);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.primary.withOpacity(0.06) : (isDark ? AppColors.darkSurface : AppColors.lightSurface).withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? AppColors.primary.withOpacity(0.4) : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.string(
                widget.item.svgIcon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  _hovered ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.label,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _hovered ? AppColors.primary : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                      ),
                    ),
                    Text(
                      widget.item.sublabel,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedSlide(
                offset: _hovered ? const Offset(0.15, 0) : Offset.zero,
                duration: const Duration(milliseconds: 180),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 15,
                  color: _hovered ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  final void Function(String name, String email, String message) onSubmit;

  const _ContactForm({required this.onSubmit});

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _submitting = false;
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 600));
    widget.onSubmit(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _messageController.text.trim(),
    );
    setState(() {
      _submitting = false;
      _submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    if (_submitted) {
      return _SuccessState(
        onReset: () => setState(() {
          _submitted = false;
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _FormField(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'Your name',
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _FormField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'your@email.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    if (!v.contains('@')) return 'Invalid email';
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _FormField(
            controller: _messageController,
            label: 'Message',
            hint: 'Tell me about your project or opportunity...',
            maxLines: 5,
            validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 46,
            child: ElevatedButton.icon(
              onPressed: _submitting ? null : _handleSubmit,
              icon: _submitting
                  ? SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send_rounded, size: 16),
              label: Text(_submitting ? 'Sending...' : 'Send Message'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 13,
              fontFamily: AppTheme.fontNunito,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
            filled: true,
            fillColor: (isDark ? AppColors.darkSurface : AppColors.lightSurface).withOpacity(0.6),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SuccessState extends StatelessWidget {
  final VoidCallback onReset;

  const _SuccessState({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF16A34A).withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF16A34A).withOpacity(0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF16A34A).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Color(0xFF16A34A),
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Message sent!',
            style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            "Thanks for reaching out. I'll get back to you within 24 hours.",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              height: 1.6,
              color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: onReset,
            child: const Text('Send another message'),
          ),
        ],
      ),
    );
  }
}
