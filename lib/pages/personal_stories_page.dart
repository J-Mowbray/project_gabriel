import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// PersonalStoriesPage displays shared experiences of pregnancy and infant loss.
///
/// This page provides a space for families to read personal narratives of loss,
/// offering connection through shared experiences and remembrance of babies who
/// have passed away. It includes a content warning, story previews, and modal views
/// for full story content.
class PersonalStoriesPage extends StatelessWidget {
  const PersonalStoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BasePageLayout(
      title: 'Personal Stories',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text('Sharing Our Stories', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(
            'Sharing stories can help us feel less alone in our grief. Here, we honor our babies by telling their stories and keeping their memory alive.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // Content warning alert with custom styling for visibility
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.withAlpha(Colors.amber, 0.9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Content Warning', style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'These stories describe personal experiences of pregnancy and infant loss. Please take care of yourself while reading, and feel free to return at another time if needed.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Gabriel's story card with preview text and read more option
          _buildStoryCard(
            context,
            title: "Gabriel's Story",
            author: "Jamie Mowbray",
            date: 'September 19, 2024',
            previewContent:
                'On the 19th of September 2024, at 1:44 in the afternoon, my baby son, Gabriel, was born too soon at 17 weeks and 6 days gestation...',
            fullContent: _gabrielsStory,
            color: AppTheme.personalStoriesCardColor,
          ),

          // Placeholder for future story submission feature
          const SizedBox(height: 24),
          ContentCard(
            title: 'Share Your Story',
            content:
                'In future versions of this app, we hope to provide a secure way for families to share their stories if they wish. This feature is currently in development.\n\nSharing your experience can help others feel less alone and can be a meaningful way to honor your baby\'s memory.',
            icon: Icons.edit,
            iconColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  /// Creates a custom card widget for displaying personal stories.
  ///
  /// This method builds a card with a colored header containing the story title,
  /// author information, and date, followed by a preview of the story content and
  /// a button to read the full narrative in a modal sheet.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The title of the story
  ///   author - The name of the story author
  ///   date - The date the story was published or the event occurred
  ///   previewContent - A short excerpt of the story to display in the card
  ///   fullContent - The complete story text
  ///   color - The theme color to use for the card header
  Widget _buildStoryCard(
    BuildContext context, {
    required String title,
    required String author,
    required String date,
    required String previewContent,
    required String fullContent,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Story header with title, author, and date information
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.withAlpha(color, 0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                const SizedBox(height: 4),
                Text('By $author • $date', style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          // Story preview content and read more button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(previewContent, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                      () => _showFullStory(
                        context,
                        title,
                        author,
                        date,
                        fullContent,
                      ),
                  child: const Text('Read Full Story'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Displays the full story content in a modal bottom sheet.
  ///
  /// Creates a draggable, scrollable sheet with the complete story text,
  /// allowing users to read the entire narrative. The sheet includes a styled header
  /// with the story title, author, and date.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The title of the story
  ///   author - The name of the story author
  ///   date - The date the story was published or the event occurred
  ///   content - The complete story text to display
  void _showFullStory(
    BuildContext context,
    String title,
    String author,
    String date,
    String content,
  ) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, controller) {
            return Column(
              children: [
                // Modal header with title, author, and date information
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag indicator for the modal sheet
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppTheme.withAlpha(Colors.white, 0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'By $author • $date',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Scrollable content area for the full story text
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(content, style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// The complete text of Gabriel's story.
  ///
  /// This narrative shares the experience of losing Gabriel at 17 weeks and 6 days
  /// gestation, and describes the family's journey through grief, the support they
  /// received, and how the app was created as a memorial to honor Gabriel's memory.
  static const String _gabrielsStory = '''
On the 19th of September 2024, at 1:44 in the afternoon, my baby son, Gabriel, was born too soon at 17 weeks and 6 days gestation. This is his story.

My fiancée Kay and I were overjoyed when we discovered we were expecting. We already had a wonderful son, Oliver, and were excited to grow our family. Everything seemed to be progressing normally at first.

At our 12-week scan, we saw Gabriel moving and kicking. His heartbeat was strong, and we were filled with hope and excitement for the future. We started to make plans, thinking about how Oliver would adjust to being a big brother and how our family dynamic would change.

But at 17 weeks, Kay noticed some concerning symptoms. We went to the hospital, worried but still hopeful that everything would be okay. The medical staff were incredible from the moment we arrived. They were kind, compassionate, and did everything they could to determine what was happening.

An ultrasound confirmed our worst fears. Gabriel's heartbeat had stopped. We were devastated beyond words. The next hours and days are somewhat of a blur, but the care we received from the hospital staff stands out in my memory.

Our bereavement midwife, Laura, and bereavement officer, Liz, guided us through the most difficult days of our lives. They explained what would happen next, helped us understand our options, and most importantly, treated Gabriel with dignity and respect. They acknowledged him as our son and validated our grief.

When Gabriel was born, the staff helped us create precious memories in the limited time we had with him. They took photos, made hand and footprints, and provided a special memory box. They helped us bathe and dress him, and gave us private time to say goodbye.

In the days that followed, we had to face the painful reality of planning a funeral for our baby. Again, the hospital staff provided invaluable guidance, connecting us with funeral directors who specialised in baby funerals and explaining the options available to us.

One of the most difficult aspects was explaining what happened to our son Oliver. How do you explain to a young child that the baby brother or sister they were expecting won't be coming home? The hospital provided resources to help us navigate this conversation, but it was still one of the hardest things we've ever had to do.

The grief of losing Gabriel has been overwhelming at times. It comes in waves – sometimes I can talk about him and our experience with composure, and other times the smallest reminder brings me to tears. I've learnt that grief isn't linear, and healing doesn't mean forgetting.

I found that creating something meaningful in Gabriel's memory has been an important part of my grief journey. That's how the idea for this app was born. I wanted to give Gabriel's life meaning and legacy whilst helping other families who find themselves in this heartbreaking situation.

I also wanted to acknowledge the incredible NHS staff who supported us, particularly Laura and Liz, whose compassion made an unbearable situation a little more bearable. Their guidance helped us navigate the practical aspects of loss while honouring our emotional needs.

Gabriel will always be part of our family. We speak his name, remember him on special days, and keep his memory alive in our hearts. Whilst his life was brief, his impact has been profound. Through this app, I hope his legacy will bring comfort to other families experiencing loss.

If you're reading this because you've experienced a similar loss, please know that you're not alone. Your grief is valid, your baby matters, and there is support available. Be gentle with yourself as you navigate this difficult journey.

In loving memory of Gabriel Ray Mowbray
September 19, 2024
Forever in our hearts
''';
}
