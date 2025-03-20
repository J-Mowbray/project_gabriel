import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// AwarenessPage provides information about pregnancy and infant loss statistics
/// and ways to raise awareness.
///
/// This page presents current statistics, awareness campaigns, ways to get
/// involved, and information about breaking the stigma and silence around
/// pregnancy and infant loss.
class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BasePageLayout(
      title: 'Raising Awareness',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text(
            'Raising Awareness of Pregnancy & Infant Loss',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Awareness helps reduce the silence and stigma around pregnancy and infant loss, encourages better support for families, and drives research into prevention.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // Statistical information about pregnancy and infant loss
          _buildSection(
            context,
            title: 'Key Statistics',
            children: [
              _buildStatisticCard(
                context,
                statistic: '1 in 4',
                description: 'Pregnancies end in miscarriage.',
                source: 'Tommy\'s Charity',
                color: AppTheme.resourcesCardColor,
              ),
              _buildStatisticCard(
                context,
                statistic: '100,000+',
                description:
                    'Estimated miscarriages occur annually in England.',
                source: 'Sands & Tommy\'s, NHS data 2021-22',
                color: AppTheme.typesOfLossCardColor,
              ),
              _buildStatisticCard(
                context,
                statistic: '4.0',
                description:
                    'Stillbirths per 1,000 births in England and Wales (2022), decreased from 4.1 in 2021.',
                source: 'Office for National Statistics (ONS)',
                color: AppTheme.awarenessCardColor,
              ),
              _buildStatisticCard(
                context,
                statistic: '1 in 90',
                description: 'Pregnancies in the UK are ectopic.',
                source: 'NHS',
                color: AppTheme.personalStoriesCardColor,
              ),
              ContentCard(
                title: 'The Importance of Data',
                content:
                    'Unlike stillbirths and neonatal deaths, miscarriages are not officially counted or recorded in national statistics. This makes it difficult to understand the full scope of pregnancy loss and limits research into prevention.',
                icon: Icons.data_usage,
                iconColor: AppTheme.supportTipsCardColor,
              ),
            ],
          ),

          // Information about established awareness campaigns and events
          _buildSection(
            context,
            title: 'Awareness Campaigns',
            children: [
              ContentCard(
                title: 'Baby Loss Awareness Week',
                content:
                    'October 9-15 each year is dedicated to raising awareness about pregnancy and baby loss in the UK. It culminates in the Wave of Light on October 15, where candles are lit at 7pm to remember babies who have died.',
                icon: Icons.calendar_today,
                iconColor: AppTheme.supportTipsCardColor,
              ),
              ContentCard(
                title:
                    'International Pregnancy and Infant Loss Remembrance Day',
                content:
                    'October 15 is observed internationally as a day of remembrance for pregnancy loss and infant death, including but not limited to miscarriage, stillbirth, SIDS, and the death of a newborn.',
                icon: Icons.public,
                iconColor: AppTheme.typesOfLossCardColor,
              ),
              ContentCard(
                title: 'Pink and Blue Ribbon',
                content:
                    'The pink and blue ribbon is the symbol of pregnancy and infant loss awareness. Pink represents the loss of a girl, blue represents the loss of a boy, and having them together represents all losses.',
                icon: Icons.volunteer_activism,
                iconColor: AppTheme.resourcesCardColor,
              ),
            ],
          ),

          // Ways users can participate in awareness activities
          _buildSection(
            context,
            title: 'How to Get Involved',
            children: [
              ContentCard(
                title: 'Share Your Story',
                content:
                    'If you feel comfortable, sharing your experience can help others feel less alone and raise awareness of the reality of pregnancy and infant loss.',
                icon: Icons.chat_bubble_outline,
                iconColor: AppTheme.supportNetworksCardColor,
              ),
              ContentCard(
                title: 'Support Organisations',
                content:
                    'Volunteer with or donate to organisations like Sands, Tommy\'s, Miscarriage Association, or Aching Arms who provide support and fund research.',
                icon: Icons.volunteer_activism,
                iconColor: AppTheme.personalStoriesCardColor,
              ),
              ContentCard(
                title: 'Participate in Events',
                content:
                    'Join walks, memorial services, and awareness events in your community, especially during Baby Loss Awareness Week.',
                icon: Icons.event,
                iconColor: AppTheme.awarenessCardColor,
              ),
              ContentCard(
                title: 'Advocate for Better Support',
                content:
                    'Support campaigns for improved bereavement care, workplace policies for pregnancy loss, and better research funding.',
                icon: Icons.campaign,
                iconColor: AppTheme.typesOfLossCardColor,
              ),
              ContentCard(
                title: 'Wave of Light',
                content:
                    'On October 15th at 7pm, light a candle in memory of babies who have died too soon and share a photo with #WaveOfLight.',
                icon: Icons.lightbulb_outline,
                iconColor: AppTheme.personalStoriesCardColor,
              ),
            ],
          ),

          // Information about reducing stigma around loss
          _buildSection(
            context,
            title: 'Breaking the Silence',
            children: [
              ContentCard(
                title: 'Why Silence Is Harmful',
                content:
                    'The silence around pregnancy and infant loss can increase feelings of isolation, shame, and stigma for bereaved parents. Breaking this silence helps everyone understand the reality of loss and how to support those affected.',
                icon: Icons.voice_over_off,
                iconColor: AppTheme.supportTipsCardColor,
              ),
              ContentCard(
                title: 'Changing the Conversation',
                content:
                    'Using clear language rather than euphemisms, acknowledging losses as real bereavements, and creating space for people to share their experiences can all help change how society views pregnancy and infant loss.',
                icon: Icons.forum,
                iconColor: AppTheme.resourcesCardColor,
              ),
            ],
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Creates a titled section containing a list of awareness content cards.
  ///
  /// This helper method builds a consistent section layout with a heading and
  /// a collection of widgets (typically cards), separated by a divider
  /// from the next section.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The section heading text
  ///   children - A list of widgets to display in the section
  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        ...children,
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  /// Creates a specialised card for displaying statistical information.
  ///
  /// This card has a distinct layout from standard ContentCards, featuring
  /// a prominent statistic display with a coloured background, followed by
  /// a description and source citation.
  ///
  /// Parameters:
  ///   context - The build context
  ///   statistic - The key figure or number to prominently display
  ///   description - Text explaining the meaning of the statistic
  ///   source - Attribution information for the statistical data
  ///   color - Accent color for the statistic display
  Widget _buildStatisticCard(
    BuildContext context, {
    required String statistic,
    required String description,
    required String source,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Highlighted statistic display with colored background
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.withAlpha(
                  color,
                  theme.brightness == Brightness.dark ? 0.3 : 0.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                statistic,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Description and source citation
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(
                    'Source: $source',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
