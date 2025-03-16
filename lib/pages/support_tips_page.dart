import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

class SupportTipsPage extends StatelessWidget {
  const SupportTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BasePageLayout(
      title: 'Support Tips',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text(
            'Supporting Yourself and Others',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Finding ways to support yourself and your loved ones through grief can be challenging. Here are some suggestions that may help during this difficult time.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          
          // Navigation sections - using ContentCard with onTap for modal
          ContentCard(
            title: 'Self-Care',
            content: "Taking care of yourself after loss is not selfish—it's necessary. Discover ways to support yourself during this difficult time.",
            icon: Icons.favorite,
            iconColor: AppTheme.supportTipsCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'Self-Care',
              _selfCareContent,
              AppTheme.supportTipsCardColor,
            ),
          ),
          
          ContentCard(
            title: 'For Partners',
            content: "Partners often experience pregnancy and infant loss differently, but both parents' grief is valid and significant.",
            icon: Icons.people,
            iconColor: AppTheme.resourcesCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'For Partners',
              _partnerContent,
              AppTheme.resourcesCardColor,
            ),
          ),
          
          ContentCard(
            title: 'For Family & Friends',
            content: 'Supporting someone through pregnancy or infant loss can be challenging. Learn how friends and family can help.',
            icon: Icons.family_restroom,
            iconColor: AppTheme.supportNetworksCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'For Family & Friends',
              _familyFriendsContent,
              AppTheme.supportNetworksCardColor,
            ),
          ),
          
          ContentCard(
            title: 'Supporting Children',
            content: 'When a baby dies, other children in the family are also affected by the loss. Learn ways to support them.',
            icon: Icons.child_care,
            iconColor: AppTheme.typesOfLossCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'Supporting Children',
              _childrenContent,
              AppTheme.typesOfLossCardColor,
            ),
          ),
          
          ContentCard(
            title: 'Returning to Work',
            content: 'Returning to work after pregnancy or baby loss can be challenging. Find guidance to help with this transition.',
            icon: Icons.work,
            iconColor: AppTheme.personalStoriesCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'Returning to Work',
              _workContent,
              AppTheme.personalStoriesCardColor,
            ),
          ),
          
          ContentCard(
            title: 'Anniversary Dates',
            content: 'Anniversary dates and milestones can intensify grief. Learn ways to navigate these difficult times.',
            icon: Icons.calendar_today,
            iconColor: AppTheme.awarenessCardColor,
            onTap: () => _showSupportDetail(
              context, 
              'Anniversary Dates',
              _anniversaryContent,
              AppTheme.awarenessCardColor,
            ),
          ),
          
          // Helpful phrases and what not to say
          const SizedBox(height: 24),
          Text(
            'Helpful Things to Say',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildQuoteList(context, _helpfulPhrases, Colors.green.shade100),
          
          const SizedBox(height: 24),
          Text(
            'Things to Avoid Saying',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildQuoteList(context, _unhelpfulPhrases, Colors.red.shade100),
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showSupportDetail(BuildContext context, String title, String content, Color iconColor) {
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
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppTheme.withAlpha(Colors.white, 0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _getIconForTitle(title),
                            color: Colors.white,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              title,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        content,
                        style: theme.textTheme.bodyLarge,
                      ),
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

  // Helper method to get the appropriate icon based on the title
  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Self-Care':
        return Icons.favorite;
      case 'For Partners':
        return Icons.people;
      case 'For Family & Friends':
        return Icons.family_restroom;
      case 'Supporting Children':
        return Icons.child_care;
      case 'Returning to Work':
        return Icons.work;
      case 'Anniversary Dates':
        return Icons.calendar_today;
      default:
        return Icons.info_outline;
    }
  }

  Widget _buildQuoteList(BuildContext context, List<String> quotes, Color backgroundColor) {
    // Always use dark text on light backgrounds and light text on dark backgrounds
    final textColor = backgroundColor.computeLuminance() > 0.5 
        ? Colors.black87  // Dark text on light backgrounds
        : Colors.white;   // Light text on dark backgrounds
    
    return Column(
      children: quotes.map((quote) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                backgroundColor == Colors.green.shade100
                    ? Icons.check_circle
                    : Icons.remove_circle,
                color: backgroundColor == Colors.green.shade100
                    ? Colors.green
                    : Colors.red,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  quote,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor, // Use computed text color based on background
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Content for different support sections
  static const String _selfCareContent = '''
Taking care of yourself after loss is not selfish—it's necessary. Here are some ways to support yourself during this difficult time:

Physical Self-Care:
• Allow yourself time to physically recover
• Try to maintain basic routines for eating and sleeping
• Consider gentle exercise when you feel ready, like walking
• Accept help with practical tasks when offered
• Don't push yourself to "get back to normal" too quickly

Emotional Self-Care:
• Acknowledge your feelings without judgment
• Give yourself permission to grieve in your own way
• Know that grief comes in waves and can be unpredictable
• Consider journaling to express and process your emotions
• Be prepared for grief triggers and have strategies for coping
• Set boundaries with people or situations that feel overwhelming

Finding Support:
• Connect with others who have experienced similar losses
• Consider joining a support group (in-person or online)
• Talk to a professional counselor or therapist who specializes in grief and loss
• Use helplines when you need immediate support
• Share your needs clearly with trusted friends and family

Taking Breaks from Grief:
• It's okay to take breaks from intense grief
• Engaging in activities you enjoy is not a betrayal of your baby
• Simple pleasures can coexist with grief
• Moments of joy do not mean you've forgotten your baby

Honoring Your Baby:
• Say your baby's name and acknowledge their existence
• Create rituals or memorials that feel meaningful to you
• Make decisions about remembrance based on what feels right for you, not others' expectations

Remember that healing is not linear, and there is no timeline for grief. Be gentle with yourself through this process.
''';

  static const String _partnerContent = '''
Partners often experience pregnancy and infant loss differently, but both parents' grief is valid and significant. Here are ways to support each other:

Understanding Different Grief Styles:
• Recognize that partners may experience and express grief differently
• Some may be more emotional, while others focus on practical matters
• Different coping strategies don't indicate differences in love or care
• There is no "right way" to grieve

Communication Strategies:
• Share your needs and feelings openly
• Listen without trying to "fix" your partner's grief
• Schedule regular check-ins about how you're both coping
• Remember that silence can be misinterpreted—try to stay connected even when it's difficult
• Consider using "I" statements to express feelings without blame

Supporting Each Other:
• Acknowledge that you're both grieving, even if it looks different
• Give each other permission to grieve individually and together
• Be patient with each other's changing emotions and needs
• Create space for both sharing and respecting privacy
• Remember significant dates together

Intimacy After Loss:
• Physical and emotional intimacy may be affected by grief
• Be patient with changes in your intimate relationship
• Communicate openly about readiness for physical intimacy
• Consider counseling if intimacy issues persist or cause distress

When Partners Disagree:
• About memorialization or remembrance
• About timing for trying again
• About how much to talk about the loss
• About seeking outside support

These differences are normal and can be navigated with compassion and communication. If you're struggling to understand each other, consider seeing a counselor who specializes in grief and relationships.

Remember that many relationships are strengthened through shared grief, even though the process can be challenging.
''';

  static const String _familyFriendsContent = '''
Supporting someone through pregnancy or infant loss can be challenging. Here's how friends and family can help:

Be Present and Listen:
• Simply being there is powerful
• Listen without trying to fix or minimize their pain
• Follow their lead in conversations
• Remember that silence can be comfortable and supportive
• Check in regularly, even months after the loss

Practical Support:
• Offer specific help rather than saying "let me know if you need anything"
• Meal preparation or delivery
• Household tasks (cleaning, laundry, shopping)
• Childcare for other children
• Transportation to appointments
• Managing communications with others if needed

Remember the Baby:
• Use the baby's name if one was given
• Acknowledge important dates (due date, birth date, loss date)
• Include the baby in family conversations when appropriate
• Remember that parents don't "get over" the loss of their child

Supporting Through Time:
• Grief doesn't follow a timeline
• Continue checking in even months later
• Be especially mindful around holidays, anniversaries, and milestones
• Understand that grief may resurface at unexpected times

What to Avoid:
• Trying to find silver linings ("at least you can get pregnant")
• Comparing losses or grief experiences
• Pushing parents to "move on" or "try again"
• Making assumptions about how they should feel
• Avoiding mention of the baby for fear of causing pain

Taking Care of Yourself:
• Supporting grieving loved ones can be emotionally taxing
• Set healthy boundaries while remaining supportive
• Seek your own support if needed
• Remember that you can't take away their pain, but your presence matters

The most important thing you can do is acknowledge their loss and show that you're willing to support them through their grief journey.
''';

  static const String _childrenContent = '''
When a baby dies, other children in the family are also affected by the loss. Here are ways to support them:

Age-Appropriate Communication:
• Use clear, simple language appropriate for their age
• Avoid euphemisms like "gone to sleep" or "lost the baby" which can be confusing
• Answer questions honestly, even if the answer is "I don't know"
• It's okay to show your emotions when talking with children
• Reassure them that they are loved and safe

What Children May Experience:
• Confusion about what happened
• Worry about parents and family stability
• Guilt (especially if they had mixed feelings about a new sibling)
• Changes in behavior, sleep, or eating patterns
• Grief expressed through play or art rather than words
• Revisiting questions as they grow and develop

Supporting Different Age Groups:
• Toddlers and preschoolers: Maintain routines, offer simple explanations, provide extra comfort
• School-age children: Answer questions, involve them in memorialization if they wish, alert teachers
• Teenagers: Give space when needed, acknowledge their grief, involve them in family discussions

Involving Children in Remembrance:
• Ask if they would like to participate in memorials or rituals
• Offer options for creating their own tributes (drawings, letters, choosing a special item)
• Create family traditions for remembering the baby
• Help them find ways to express their feelings

Warning Signs That Extra Support May Be Needed:
• Prolonged changes in behavior or personality
• Academic difficulties
• Withdrawal from friends or activities
• Physical symptoms with no medical cause
• Talk of wanting to join the baby who died

Resources for children experiencing grief include school counselors, child psychologists who specialize in grief, and books about sibling loss appropriate for their age.

Remember that children are resilient, especially when supported with honest communication and consistent care. They take cues from adults about how to respond to loss, so modeling healthy grief can help them develop their own coping skills.
''';

  static const String _workContent = '''
Returning to work after pregnancy or infant loss can be challenging. Here's guidance for navigating this transition:

For Those Who Have Experienced Loss:

Before Returning:
• Understand your leave entitlements - speak to HR about options
• Consider a phased return if possible
• Communicate with your manager about what colleagues have been told
• Decide how you want to handle questions or comments
• Prepare responses for common questions
• Identify a private space you can use if you need time alone

At Work:
• Take breaks when needed
• Set boundaries around discussing your loss
• Have a trusted colleague who understands your situation
• Keep grief support resources accessible
• Be prepared for unexpected grief triggers
• Adjust expectations of your productivity as you adjust

For Managers and Colleagues:

How to Support:
• Follow the employee's lead on how much they want to discuss
• Offer flexibility with schedules and workload where possible
• Check in privately rather than in group settings
• Remember significant dates that might be difficult
• Avoid assumptions about how quickly someone should "move on"
• Understand that grief can affect concentration and energy

Workplace Accommodation:
• Flexible hours or work-from-home options when possible
• Temporary adjustment of responsibilities
• Private space for breaks when needed
• Clear communication about expectations during transition
• Regular, supportive check-ins

Creating a Supportive Environment:
• Train managers on supporting employees through loss and grief
• Develop clear policies around bereavement leave that include pregnancy loss
• Provide resources for all employees on supporting grieving colleagues
• Consider workplace rituals for acknowledging loss (if the employee wants this)

Remember that returning to work can be both helpful (providing routine and purpose) and challenging (emotionally taxing). Each person's experience is unique, and flexibility is key to supporting successful transitions back to work.
''';

  static const String _anniversaryContent = '''
Anniversary dates and milestones can intensify grief. Here are ways to navigate these difficult times:

Significant Dates May Include:
• The date of loss
• Due date or birth date
• Monthly anniversaries, especially in the first year
• Mother's Day and Father's Day
• Holidays and family celebrations
• Milestones the baby would have reached (first birthday, starting school)

Preparing for Difficult Dates:
• Acknowledge that these days may be challenging
• Plan ahead for how you'd like to spend the day
• Consider taking time off work if possible
• Let supportive people know about significant dates
• Decide whether you prefer to be alone or with others
• Create meaningful rituals or traditions

Ideas for Remembrance:
• Light a special candle
• Visit a meaningful place
• Plant something in your baby's memory
• Write a letter or journal entry
• Make a donation to a relevant charity
• Create or add to a memory box
• Share memories and say your baby's name
• Join remembrance events (like Wave of Light for Baby Loss Awareness Week)

Taking Care of Yourself:
• Lower expectations for yourself around these times
• Build in self-care activities
• Have support people on standby
• Remember that anticipation can sometimes be harder than the day itself
• Be flexible with your plans - it's okay to change your mind
• Honor your feelings whatever they may be

For Family and Friends:
• Mark these dates in your calendar
• Reach out to acknowledge the day
• Say the baby's name
• Offer specific support
• Understand if plans change or are canceled
• Follow the parents' lead about how to mark the occasion

Anniversary reactions can occur for many years. They often become less intense with time, but may always hold significance. Creating meaningful ways to honor your baby on these dates can transform difficult days into opportunities for connection and remembrance.
''';

  // Lists of helpful and unhelpful phrases
  static const List<String> _helpfulPhrases = [
    "I'm so sorry for your loss.",
    "I'm here for you.",
    "[Baby's name] will always be part of your family.",
    "Take all the time you need.",
    "I don't know what to say, but I want you to know I care.",
    "Would it help to talk about it? I'm here to listen whenever you need.",
    "Can I bring you a meal this week?",
    "I remember [something specific about the baby or pregnancy].",
    "This must be so difficult for you.",
    "Your feelings are completely valid.",
  ];

  static const List<String> _unhelpfulPhrases = [
    "At least you know you can get pregnant.",
    "Everything happens for a reason.",
    "At least it happened early in the pregnancy.",
    "You're young, you can have another.",
    "It wasn't meant to be.",
    "At least you have other children.",
    "I know how you feel.",
    "You should be over this by now.",
    "You need to be strong.",
    "It was God's plan.",
  ];
}