
import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  static const Color background = Color(0xFF00000);
  static const Color primary = Color(0xFF03045E);
  static const Color accent = Color(0xFF0096C7);
  static const Color secondaryText = Color(0xFFB8C4D6);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 650;
          final isTablet = constraints.maxWidth < 1000;

          return Container(
            width: double.infinity,
            color: background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 22 : 55,
                    vertical: 45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(
                        isMobile: isMobile,
                        isTablet: isTablet,
                      ),
                      const SizedBox(height: 40),
                      _buildNewsletter(isMobile),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white12,
                  height: 1,
                ),
                _buildBottomBar(isMobile),
              ],
            ),
          );
        },
      ),
    );
  }

  // Main Footer Content

  Widget _buildMainContent({
    required bool isMobile,
    required bool isTablet,
  }) {
    final sections = [
      _buildBrandSection(),
      _buildLinksSection(
        'دسترسی سریع',
        [
          'صفحه اصلی',
          'فروشگاه',
          'محصولات جدید',
          'تخفیف‌ها',
        ],
      ),
      _buildLinksSection(
        'خدمات مشتریان',
        [
          'راهنمای خرید',
          'پیگیری سفارش',
          'قوانین و مقررات',
          'سوالات متداول',
        ],
      ),
      _buildContactSection(),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sections[0],
          const SizedBox(height: 35),
          sections[1],
          const SizedBox(height: 30),
          sections[2],
          const SizedBox(height: 30),
          sections[3],
        ],
      );
    }

    if (isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: sections[0]),
              const SizedBox(width: 25),
              Expanded(child: sections[1]),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: sections[2]),
              const SizedBox(width: 25),
              Expanded(child: sections[3]),
            ],
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: sections[0]),
        const SizedBox(width: 35),
        Expanded(child: sections[1]),
        const SizedBox(width: 25),
        Expanded(child: sections[2]),
        const SizedBox(width: 25),
        Expanded(child: sections[3]),
      ],
    );
  }

  // Brand Section

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: accent,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              'SupaStore',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Text(
          'تجربه خریدی آسان، سریع و مطمئن.\n'
              'در سوپاستور تلاش می‌کنیم بهترین محصولات '
              'را با بهترین قیمت در اختیار شما قرار دهیم.',
          style: TextStyle(
            color: secondaryText,
            fontSize: 13,
            height: 2,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _socialIcon(Icons.telegram),
            _socialIcon(Icons.camera_alt_outlined),
            _socialIcon(Icons.facebook),
          ],
        ),
      ],
    );
  }

  // Links Section

  Widget _buildLinksSection(
      String title,
      List<String> items,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        const SizedBox(height: 22),
        ...items.map(
              (item) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: () {},
              child: Text(
                item,
                style: const TextStyle(
                  color: secondaryText,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Contact Section

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('ارتباط با ما'),
        const SizedBox(height: 22),
        _contactItem(
          Icons.phone_outlined,
          '021-12345678',
        ),
        _contactItem(
          Icons.email_outlined,
          'info@supastore.ir',
        ),
        _contactItem(
          Icons.location_on_outlined,
          'تهران، خیابان ولیعصر',
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_user_outlined,
                color: accent,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'خرید امن و مطمئن',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Newsletter Section

  Widget _buildNewsletter(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 550;

          final description = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'از تخفیف‌ها باخبر شو!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'عضو خبرنامه ما شو و اولین نفری باش '
                    'که از پیشنهادهای ویژه باخبر می‌شوی.',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 12,
                  height: 1.8,
                ),
              ),
            ],
          );

          final emailField = SizedBox(
            width: compact ? double.infinity : 300,
            child: TextField(
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: 'آدرس ایمیل شما',
                hintStyle: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.07),
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  color: accent,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description,
                const SizedBox(height: 20),
                emailField,
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: description),
              const SizedBox(width: 25),
              emailField,
            ],
          );
        },
      ),
    );
  }

  // Bottom Bar

  Widget _buildBottomBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 22,
      ),
      child: Wrap(
        alignment: isMobile
            ? WrapAlignment.center
            : WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 15,
        runSpacing: 15,
        children: const [
          Text(
            '© 2026 تمام حقوق برای SupaStore محفوظ است.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
          Text(
            'طراحی شده با ❤️',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Widgets

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _contactItem(
      IconData icon,
      String text,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Row(
        children: [
          Icon(
            icon,
            color: accent,
            size: 19,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                color: secondaryText,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: Colors.white70,
        size: 19,
      ),
    );
  }
}
