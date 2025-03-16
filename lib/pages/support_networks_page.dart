import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// SupportNetworksPage displays organizations that provide support for families
/// experiencing pregnancy and infant loss.
///
/// This page categorizes support organizations by region and type, providing
/// information about each organization and links to their websites where users
/// can access help and resources.
class SupportNetworksPage extends StatelessWidget {
  const SupportNetworksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BasePageLayout(
      title: 'Support Networks',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text(
            'Support Organizations',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'These organizations provide support, resources, and community for families experiencing pregnancy and infant loss. Visit their websites for the most current contact information and support options.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          
          // Information note about contacting organizations
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.withAlpha(theme.colorScheme.primary, 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Most organizations offer helplines, email support, and other contact options on their websites.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // UK support organizations section
          _buildSection(
            context,
            'UK Organizations',
            [
              ContentCard(
                title: 'Sands',
                content: 'Stillbirth and neonatal death charity providing support to anyone affected by the death of a baby.',
                icon: Icons.healing,
                iconColor: AppTheme.supportNetworksCardColor,
                onTap: () => _launchURL('https://www.sands.org.uk'),
              ),
              ContentCard(
                title: 'Tommy\'s',
                content: 'Funds research into miscarriage, stillbirth and premature birth, and provides information for parents-to-be.',
                icon: Icons.healing,
                iconColor: AppTheme.resourcesCardColor,
                onTap: () => _launchURL('https://www.tommys.org'),
              ),
              ContentCard(
                title: 'The Miscarriage Association',
                content: 'Offers support and information to anyone affected by miscarriage, ectopic pregnancy or molar pregnancy.',
                icon: Icons.healing,
                iconColor: AppTheme.personalStoriesCardColor,
                onTap: () => _launchURL('https://www.miscarriageassociation.org.uk'),
              ),
              ContentCard(
                title: 'Aching Arms',
                content: 'A baby loss charity that helps bereaved parents and their families by providing comfort bears and support.',
                icon: Icons.healing,
                iconColor: AppTheme.supportNetworksCardColor,
                onTap: () => _launchURL('https://www.achingarms.co.uk'),
              ),
              ContentCard(
                title: 'Petals',
                content: 'Provides specialist counselling for parents who have experienced the death of a baby.',
                icon: Icons.healing,
                iconColor: AppTheme.supportTipsCardColor,
                onTap: () => _launchURL('https://www.petalscharity.org'),
              ),
              ContentCard(
                title: 'Cradle',
                content: 'Supporting families through early pregnancy loss and beyond.',
                icon: Icons.healing,
                iconColor: AppTheme.awarenessCardColor,
                onTap: () => _launchURL('https://cradlecharity.org'),
              ),
            ],
          ),
          
          // Support resources specifically for partners/fathers
          _buildSection(
            context,
            'Support for Partners',
            [
              ContentCard(
                title: 'Sands - Support for Men',
                content: 'Dedicated support for fathers affected by the death of a baby.',
                icon: Icons.healing,
                iconColor: AppTheme.typesOfLossCardColor,
                onTap: () => _launchURL('https://www.sands.org.uk/support-you/how-we-offer-support/men'),
              ),
              ContentCard(
                title: 'The Lullaby Trust - Bereaved Dads and Partners',
                content: 'Specific support for fathers, partners and co-parents who have experienced baby loss.',
                icon: Icons.healing,
                iconColor: AppTheme.resourcesCardColor,
                onTap: () => _launchURL('https://www.lullabytrust.org.uk/bereavement-support/find-support/bereaved-dads-partners-co-parents/'),
              ),
            ],
          ),
          
          // Global organizations for pregnancy and infant loss support
          _buildSection(
            context,
            'International Organizations',
            [
              ContentCard(
                title: 'International Stillbirth Alliance',
                content: 'Global organization working to prevent stillbirth and improve bereavement care worldwide.',
                icon: Icons.healing,
                iconColor: AppTheme.awarenessCardColor,
                onTap: () => _launchURL('https://www.stillbirthalliance.org'),
              ),
              ContentCard(
                title: 'Share Pregnancy & Infant Loss Support',
                content: 'US-based organization providing support for families who have experienced miscarriage, stillbirth, or infant death.',
                icon: Icons.healing,
                iconColor: AppTheme.personalStoriesCardColor,
                onTap: () => _launchURL('https://nationalshare.org'),
              ),
            ],
          ),
          
          // Virtual communities and online support groups
          _buildSection(
            context,
            'Online Communities',
            [
              ContentCard(
                title: 'Baby Loss Hour',
                content: 'Twitter-based community that meets every Tuesday 8-9pm UK time using #BabyLossHour.',
                icon: Icons.public,
                iconColor: AppTheme.resourcesCardColor,
                onTap: () => _launchURL('https://twitter.com/hashtag/BabyLossHour'),
              ),
              ContentCard(
                title: 'Sands Online Community',
                content: 'A safe, online space where anyone affected by the death of a baby can connect with others.',
                icon: Icons.forum,
                iconColor: AppTheme.supportNetworksCardColor,
                onTap: () => _launchURL('https://www.sands.community'),
              ),
            ],
          ),
          
          // Information about finding local in-person support
          _buildSection(
            context,
            'Local Support',
            [
              ContentCard(
                title: 'Find Local Support Groups',
                content: 'Many hospitals and organizations offer local support groups. Contact your hospital\'s bereavement midwife or officer for information about groups in your area.',
                icon: Icons.location_on,
                iconColor: AppTheme.supportTipsCardColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Creates a titled section containing a list of support organization cards.
  ///
  /// This helper method builds a consistent section layout with a heading and
  /// a collection of content cards representing support organizations or resources,
  /// separated by a divider from the next section.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The section heading text
  ///   cards - A list of widgets (typically ContentCard widgets) to display in the section
  Widget _buildSection(BuildContext context, String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...cards,
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  /// Opens the specified URL in the device's external browser.
  ///
  /// This method attempts to launch the provided URL in the device's default
  /// external browser application. If the URL cannot be launched, an exception
  /// is thrown with an error message.
  ///
  /// Parameters:
  ///   urlString - The web address to open
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }
}