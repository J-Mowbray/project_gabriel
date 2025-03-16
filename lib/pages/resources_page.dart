import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart'; 
import 'package:gabrielsstar/theme/theme_config.dart';

/// ResourcesPage provides helpful information for families experiencing pregnancy and infant loss.
///
/// This page organizes essential resources into themed sections, covering topics like
/// what to expect after loss, family support, memory making, and practical matters.
/// Each resource is presented as a card that can be tapped to view detailed content
/// in a modal bottom sheet.
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BasePageLayout(
      title: 'Resources',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text(
            'Helpful Resources for Your Journey',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Finding your way through grief can be difficult. Below are resources that may help you navigate this challenging time.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          
          // "What to Expect" section with resources for immediate aftermath of loss
          _buildSection(
            context,
            'What to Expect',
            [
              ContentCard(
                title: 'Immediate Next Steps',
                content: 'Information about hospital procedures, memory making, and important decisions you may need to make in the coming days.',
                icon: Icons.calendar_today,
                iconColor: AppTheme.resourcesCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Immediate Next Steps',
                  _immediateNextStepsContent,
                  icon: Icons.calendar_today,
                ),
              ),
              ContentCard(
                title: 'Physical Recovery',
                content: 'Understanding your body\'s healing process and what physical symptoms you might experience.',
                icon: Icons.favorite,
                iconColor: AppTheme.supportTipsCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Physical Recovery',
                  _physicalRecoveryContent,
                  icon: Icons.favorite,
                ),
              ),
              ContentCard(
                title: 'Emotional Journey',
                content: 'The grief process and the range of emotions you might experience in the coming weeks and months.',
                icon: Icons.sentiment_satisfied_alt,
                iconColor: AppTheme.typesOfLossCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Emotional Journey',
                  _emotionalJourneyContent,
                  icon: Icons.sentiment_satisfied_alt,
                ),
              ),
            ],
          ),
          
          // "For Families" section with resources to support family members
          _buildSection(
            context,
            'For Families',
            [
              ContentCard(
                title: 'Talking to Children',
                content: 'Age-appropriate ways to explain loss to siblings and supporting children through grief.',
                icon: Icons.child_care,
                iconColor: AppTheme.supportNetworksCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Talking to Children',
                  _talkingToChildrenContent,
                  icon: Icons.child_care,
                ),
              ),
              ContentCard(
                title: 'Supporting Your Partner',
                content: 'Understanding different grieving styles and how to support each other through loss.',
                icon: Icons.people,
                iconColor: AppTheme.personalStoriesCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Supporting Your Partner',
                  _supportingPartnerContent,
                  icon: Icons.people,
                ),
              ),
              ContentCard(
                title: 'Involving Extended Family',
                content: 'How to communicate your needs with family members and involving them in memory-making.',
                icon: Icons.family_restroom,
                iconColor: AppTheme.awarenessCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Involving Extended Family',
                  _extendedFamilyContent,
                  icon: Icons.family_restroom,
                ),
              ),
            ],
          ),
          
          // "Memory Making" section with resources for honoring and remembering babies
          _buildSection(
            context,
            'Memory Making',
            [
              ContentCard(
                title: 'Creating Mementos',
                content: 'Ideas for creating lasting memories of your baby.',
                icon: Icons.photo_album,
                iconColor: AppTheme.personalStoriesCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Creating Mementos',
                  _mementosContent,
                  icon: Icons.photo_album,
                ),
              ),
              ContentCard(
                title: 'Memorial Ideas',
                content: 'Ways to honor and remember your baby through memorials or tributes.',
                icon: Icons.local_florist,
                iconColor: AppTheme.supportTipsCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Memorial Ideas',
                  _memorialIdeasContent,
                  icon: Icons.local_florist,
                ),
              ),
              ContentCard(
                title: 'Annual Remembrance',
                content: 'Ideas for marking special dates and anniversaries.',
                icon: Icons.event,
                iconColor: AppTheme.typesOfLossCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Annual Remembrance',
                  _annualRemembranceContent,
                  icon: Icons.event,
                ),
              ),
            ],
          ),
          
          // "Practical Matters" section with resources for navigating logistical challenges
          _buildSection(
            context,
            'Practical Matters',
            [
              ContentCard(
                title: 'Financial Support',
                content: 'Information about available benefits, funeral costs, and financial assistance.',
                icon: Icons.attach_money,
                iconColor: AppTheme.supportNetworksCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Financial Support',
                  _financialSupportContent,
                  icon: Icons.attach_money,
                ),
              ),
              ContentCard(
                title: 'Returning to Work',
                content: 'Guidance on taking time off, communicating with employers, and transitioning back to work.',
                icon: Icons.work,
                iconColor: AppTheme.resourcesCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Returning to Work',
                  _returningToWorkContent,
                  icon: Icons.work,
                ),
              ),
              ContentCard(
                title: 'Legal Rights',
                content: 'Understanding your entitlements regarding leave, certificates, and registration.',
                icon: Icons.gavel,
                iconColor: AppTheme.awarenessCardColor,
                onTap: () => _showResourceDetail(
                  context, 
                  'Legal Rights',
                  _legalRightsContent,
                  icon: Icons.gavel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Creates a titled section containing a list of resource cards.
  ///
  /// This helper method builds a consistent section layout with a title and 
  /// a collection of content cards, separated by a divider from the next section.
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

  /// Displays detailed resource content in a modal bottom sheet.
  ///
  /// Creates a draggable, scrollable sheet with the complete resource text,
  /// allowing users to read comprehensive information on the selected topic.
  /// The sheet includes a styled header with an icon and the resource title.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The title of the resource
  ///   content - The detailed content text to display
  ///   icon - Optional icon to display in the header (default is info_outline)
  void _showResourceDetail(
    BuildContext context, 
    String title, 
    String content, 
    {IconData icon = Icons.info_outline}
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
                // Modal header with title and icon
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
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
                // Scrollable content area for the resource text
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

  /// Resource content for immediate steps after pregnancy or infant loss.
  ///
  /// Provides information about hospital procedures, memory-making opportunities,
  /// and important decisions that families may need to make in the days following loss.
  static const String _immediateNextStepsContent = '''
When you experience the loss of a baby, the following days can feel overwhelming. Here are some things that might happen and decisions you may need to make:

• Hospital procedures: The medical staff will explain any necessary medical procedures and options available to you.

• Memory making: The hospital may offer opportunities to create memories with your baby, such as taking photographs, handprints, footprints, or locks of hair. Take your time with these decisions - there is no right or wrong choice.

• Naming your baby: Many parents choose to name their baby. This can be an important part of acknowledging your baby's existence and importance.

• Funeral arrangements: Depending on the gestational age, you may need to make decisions about burial or cremation. Hospital staff can guide you through these options.

• Taking your baby home: In some circumstances, you may be able to take your baby home for a short time. Ask your healthcare provider about this option if it's something you want to consider.

Remember that hospital staff, particularly bereavement midwives and officers, are there to support you through these decisions. Don't hesitate to ask questions or for more time if you need it.
''';

  /// Resource content for physical recovery after pregnancy or infant loss.
  ///
  /// Provides information about physical changes, recovery, and important
  /// warning signs to watch for following pregnancy loss.
  static const String _physicalRecoveryContent = '''
After pregnancy loss, your body will go through a recovery process. Here's what you might experience:

• Bleeding and discharge: You may experience bleeding similar to a heavy period, which can last for up to two weeks. The amount should gradually decrease.

• Breast changes: Your breasts may become engorged and leak milk, particularly in later pregnancy losses. Cold compresses and supportive bras can help manage discomfort.

• Hormonal changes: As pregnancy hormones leave your body, you may experience mood swings, which can intensify grief emotions.

• Pain and discomfort: You might have cramping, similar to period pain. Your healthcare provider can recommend appropriate pain relief.

• Fatigue: Physical recovery, combined with emotional stress, can be exhausting. Rest when you can and don't push yourself too hard.

Important warning signs to watch for:
- Heavy bleeding (soaking through a pad every hour)
- Severe pain not relieved by medication
- Fever or chills
- Foul-smelling discharge

Contact your healthcare provider immediately if you experience any of these symptoms.

Your follow-up appointment is important for checking your physical recovery. Don't hesitate to ask questions about your physical healing and any concerns you have about future pregnancies.
''';

  /// Resource content about the emotional aspects of grief following loss.
  ///
  /// Describes the range of emotions that may be experienced during grief,
  /// validating different responses and providing coping strategies.
  static const String _emotionalJourneyContent = '''
Grief after pregnancy loss is a deeply personal experience that can involve a wide range of emotions. Here's what you might experience:

• Shock and numbness: Initially, you might feel disconnected or struggle to accept what has happened.

• Intense sadness: Waves of grief can come unexpectedly and be triggered by various reminders.

• Anger: You might feel angry at yourself, your partner, healthcare providers, or others with healthy pregnancies.

• Guilt: Many parents wonder if they did something to cause the loss, even when there was nothing they could have done.

• Anxiety: Fears about future pregnancies or heightened anxiety about other aspects of life are common.

• Emptiness: Physical sensations of emptiness can accompany emotional feelings of void.

• Jealousy: Seeing other pregnant women or babies can be particularly difficult.

• Relief: If the pregnancy was complicated or the baby had a condition incompatible with life, you might feel relief alongside grief, which can then trigger guilt.

All of these feelings are normal responses to loss. There is no "right way" to grieve, and healing is not linear. Some days will be better than others.

Strategies that might help:
- Talk about your feelings with trusted people
- Join a support group with others who have experienced similar losses
- Create rituals to remember your baby
- Be patient with yourself and allow time for healing
- Consider professional help if grief becomes overwhelming

Most importantly, remember that you are not alone, and support is available when you need it.
''';

  /// Resource content for explaining loss to children.
  ///
  /// Provides age-appropriate guidance for discussing pregnancy or infant loss
  /// with siblings and supporting children through grief.
  static const String _talkingToChildrenContent = '''
Explaining the loss of a baby to other children in the family can be challenging. Here are some age-appropriate approaches:

For young children (2-5 years):
• Use simple, concrete language
• Avoid euphemisms like "gone to sleep" which can cause confusion or fear
• Explain that the baby was too small or sick to grow and live outside mommy's body
• Reassure them that they are safe and loved
• Answer questions honestly but simply

For school-age children (6-12 years):
• Provide more details about what happened, using age-appropriate medical terms
• Reassure them that nothing they did or thought caused the baby to die
• Let them know it's okay to feel sad, angry, or confused
• Involve them in memorial activities if they wish to participate

For teenagers:
• Have honest conversations about the loss
• Acknowledge that their grief matters too
• Understand they may process grief differently than adults
• Give them space when needed but check in regularly

All children, regardless of age:
• May revisit questions as they grow and develop
• May have delayed reactions or process grief in spurts
• Benefit from seeing that it's okay for adults to express emotions
• Need reassurance about their own safety and security

Children's reactions may include:
• Regression to earlier behaviors
• Changes in sleep or eating patterns
• Acting out or withdrawing
• Asking repeated questions
• Expressing worry about other family members dying

Consider children's books about pregnancy loss or sibling grief as helpful tools for discussion. School counselors can also provide support if children are struggling.
''';

  /// Resource content about supporting partners through grief.
  ///
  /// Addresses how couples may experience grief differently and provides
  /// guidance for maintaining communication and supporting each other.
  static const String _supportingPartnerContent = '''
Couples often experience grief differently, which can sometimes lead to misunderstandings or feelings of isolation. Understanding these differences can help you support each other:

Different grieving styles:
• Some people process grief by talking and expressing emotions openly
• Others may grieve more privately or through activity and problem-solving
• Neither approach is better - they're just different ways of coping

Supporting each other:
• Communicate openly about your needs and feelings
• Listen without judgment when your partner shares
• Respect differences in grieving styles
• Remember that the intensity and timing of grief may differ between partners
• Be patient with each other - grief can affect concentration, memory, and energy levels

Challenges couples may face:
• Different timing in processing grief
• Misinterpreting a partner's coping mechanism as lack of caring
• Changes in physical intimacy and sexual relationships
• Differences in readiness to try for another pregnancy
• Disagreements about how to memorialize or talk about the baby

When to seek help:
• If you're struggling to communicate
• If one or both partners feel isolated in their grief
• If grief is causing significant tension in the relationship
• If either partner is using unhealthy coping mechanisms

Remember that many couples experience relationship strain after pregnancy loss, but with communication and support, your relationship can survive and even strengthen through this difficult experience.
''';

  /// Resource content about extended family support and interactions.
  ///
  /// Provides guidance for communicating needs to extended family members
  /// and involving them in the grieving and remembrance process.
  static const String _extendedFamilyContent = '''
Extended family members and friends can be important sources of support, but interactions can sometimes be complicated by different grief responses or unhelpful comments. Here are some strategies for navigating these relationships:

Communicating your needs:
• Be specific about how others can help (meals, childcare, household tasks)
• Set boundaries when you need space
• Let people know what types of comments are helpful or unhelpful
• Designate a contact person to share updates so you don't have to repeat information

Involving family in memory-making:
• Invite family members to participate in memorial services if appropriate
• Share your baby's name and identity with them
• Consider ways grandparents, aunts, uncles, and others can acknowledge their own grief
• Create family rituals for remembering your baby on significant dates

Dealing with unhelpful responses:
• Some people may avoid the topic or try to minimize your loss
• Others might make insensitive comments despite good intentions
• Remember that these reactions often stem from discomfort with grief or not knowing what to say
• Prepare simple responses for difficult situations

Supporting grandparents and others:
• Recognize that they are experiencing their own grief
• Direct them to resources specifically for grandparents after pregnancy loss
• Understand that previous generations may have been taught to "move on" from pregnancy loss

Remember that you don't need to manage others' emotions while dealing with your own grief. It's okay to take space from relationships that drain rather than support you during this time.
''';

  /// Resource content about creating physical mementos.
  ///
  /// Provides ideas for creating and preserving tangible memories
  /// of babies who have died through pregnancy or infant loss.
  static const String _mementosContent = '''
Creating tangible memories of your baby can be meaningful and healing. Here are some ways to create mementos:

Hospital mementos:
• Handprints and footprints
• Locks of hair
• Photographs
• Hospital identification bracelets
• Blankets or clothing that held your baby

Memory boxes:
• Special boxes to keep mementos together
• Can include ultrasound images, pregnancy test, hospital wristbands, sympathy cards

Artwork and photography:
• Professional remembrance photography (organizations like Remember My Baby offer free services)
• Commissioned artwork based on photos or ultrasound images
• Painting with ashes incorporated (for babies who were cremated)

Jewelry:
• Necklaces or bracelets with your baby's name
• Pieces that include birthstone or expected due date stone
• Fingerprint or footprint jewelry
• Jewelry that holds a small amount of ashes

Personalized items:
• Teddy bears or stuffed animals made from baby clothes
• Quilts made from baby clothes or blankets
• Custom ornaments for holidays
• Garden stones or plaques

Digital memorials:
• Memorial websites
• Social media remembrance pages
• Digital scrapbooks

The hospital bereavement team may provide some of these items or direct you to organizations that offer them. Many parents find that creating and displaying these mementos helps acknowledge their baby's existence and importance in the family.
''';

  /// Resource content about creating memorials and tributes.
  ///
  /// Provides ideas for formal and informal ways to memorialize and
  /// honor babies who have died through pregnancy or infant loss.
  static const String _memorialIdeasContent = '''
Creating a memorial for your baby can provide a meaningful way to honor their memory and give you a space for reflection and remembrance. Here are some memorial ideas:

Formal memorials:
• Memorial service or funeral
• Naming ceremony
• Balloon or butterfly release (using environmentally friendly options)
• Candle lighting ceremony
• Tree planting

Home memorials:
• Memory garden or special plants
• Dedicated shelf or space with photos and mementos
• Memorial candle to light on special occasions
• Wind chimes or garden ornaments
• Stars named after your baby
• Charitable donations in your baby's name

Community remembrance:
• Adding your baby's name to a remembrance book or wall
• Participating in annual remembrance walks or services
• Contributing to community gardens or projects
• Supporting hospital bereavement services

Online memorials:
• Memorial websites or pages
• Social media remembrance groups
• Digital scrapbooks or photo albums

Creative expressions:
• Writing poems, letters, or songs
• Creating artwork inspired by your baby
• Keeping a journal of thoughts and feelings

Remember that memorials can be as private or public as you feel comfortable with. They can evolve over time as your grief journey continues, and you can create different types of memorials for different occasions or milestones.
''';

  /// Resource content about marking significant dates and anniversaries.
  ///
  /// Provides guidance for remembering and honoring babies on special dates,
  /// including birthdays, due dates, and awareness events.
  static const String _annualRemembranceContent = '''
Finding ways to mark significant dates and anniversaries can be an important part of your ongoing journey with grief. Here are some ideas for annual remembrance:

Significant dates to consider:
• Due date
• Birth/loss date
• Special holidays (Mother's Day, Father's Day, Christmas, etc.)
• Baby Loss Awareness Week (October 9-15)
• Wave of Light (October 15)

Ideas for marking these dates:
• Light a special candle
• Visit a significant place
• Add to a memory box or journal
• Plant something new in a memorial garden
• Create or commission something artistic
• Take time for self-care or reflection
• Gather with supportive friends or family
• Participate in a remembrance event
• Make a donation to a relevant charity
• Do a random act of kindness in your baby's memory

Planning ahead:
• Mark these dates on your calendar so they don't catch you by surprise
• Consider taking time off work if possible
• Communicate with your partner about how you'd like to spend the day
• Be flexible with your plans - your needs may change as the day approaches
• Consider creating traditions that can evolve over time

Remember that grief can be unpredictable, and anniversary dates may bring stronger emotions than expected. There is no right or wrong way to mark these occasions - what matters is finding what feels meaningful to you.

Many parents find that while the intensity of grief may change over time, maintaining these remembrance rituals provides a special time to connect with their baby's memory year after year.
''';

  /// Resource content about financial considerations after loss.
  ///
  /// Provides information about financial support, benefits, and
  /// considerations for families following pregnancy or infant loss.
  static const String _financialSupportContent = '''
The financial aspects of pregnancy and baby loss can add stress during an already difficult time. Here is information about potential financial support and considerations:

Funeral expenses:
• In the UK, funeral costs for babies and children are waived by many funeral directors
• Some councils do not charge burial or cremation fees for babies
• The Children's Funeral Fund for England covers burial and cremation fees for children under 18
• Similar schemes exist in Wales and Scotland
• Ask the hospital bereavement team about local arrangements

Maternity/paternity benefits:
• You are still entitled to maternity leave and pay if your baby is stillborn after 24 weeks
• Partners may be entitled to paternity leave and pay in these circumstances
• If loss occurs before 24 weeks, you may be entitled to sick leave and statutory sick pay
• Some employers have compassionate policies with additional provisions

Benefits and financial support:
• Sure Start Maternity Grant or Funeral Payment may be available in some circumstances
• You may be eligible for Bereavement Support Payment if you were married or in a civil partnership
• Check if you're eligible for benefits like Universal Credit or Housing Benefit if your financial situation has changed

Charitable support:
• Some baby loss charities offer small grants for memorial items or counseling
• Organizations like Turn2Us can help you identify benefits you may be entitled to

Workplace considerations:
• Check your employment contract for compassionate leave provisions
• Discuss flexible return to work options with your employer
• Consider a phased return if full-time work feels overwhelming
• Some workplaces offer employee assistance programs with financial counseling

Planning ahead:
• Give yourself time before making major financial decisions
• Consider seeking advice from a financial advisor if your situation has significantly changed
• Be aware that grief can affect concentration and decision-making

If you're struggling financially, reach out to citizens advice or specialist financial support services. Remember that it's okay to ask for help during this difficult time.
''';

  /// Resource content about returning to work after loss.
  ///
  /// Provides guidance for transitioning back to work, communicating with
  /// colleagues, and managing grief in the workplace.
  static const String _returningToWorkContent = '''
Returning to work after pregnancy or baby loss can be challenging emotionally and practically. Here's guidance to help with this transition:

Before returning:
• Know your rights regarding leave entitlement
• Consider when you feel ready to return - there's no "right" timeframe
• Discuss with your GP if you need more time (sick leave may be appropriate)
• Consider a phased return or flexible working if available
• Decide what you want colleagues to know about your loss

Preparing colleagues:
• If comfortable, communicate with your manager about what happened
• Decide if you want to tell colleagues yourself or have someone else inform them
• Consider sending an email before your return explaining how you'd like people to approach the subject
• Prepare responses for common questions or comments
• Identify a supportive colleague who understands your situation

Self-care at work:
• Identify a private space you can use if you need time alone
• Plan shorter days initially if possible
• Schedule regular breaks
• Consider what might trigger grief at work and plan how to handle these situations
• Bring comforting items to your workspace
• Set boundaries around discussing your loss

For managers supporting employees:
• Follow the employee's lead on how much they want to discuss
• Offer practical support like a phased return or temporary adjustment of duties
• Check in privately rather than in group settings
• Remember significant dates that might be difficult
• Understand that grief can affect concentration and energy
• Provide information about employee assistance programs if available

Remember that returning to work can be both helpful (providing routine and distraction) and challenging. Be patient with yourself, and don't hesitate to communicate your needs or seek additional support if the transition proves difficult.
''';

  /// Resource content about legal rights and entitlements after loss.
  ///
  /// Provides information about legal documentation, employment rights,
  /// and entitlements based on the gestational age at time of loss.
  static const String _legalRightsContent = '''
Understanding your legal rights and entitlements following pregnancy or baby loss can help you make informed decisions. Here's information about key legal considerations:

In the UK, legal entitlements differ based on the gestation at the time of loss:

For losses after 24 weeks (stillbirth):
• Legal registration of the birth and death is required
• You'll receive a birth and death certificate
• You're entitled to full maternity leave and pay (if eligible)
• Partners may be entitled to paternity leave and pay
• You have the right to arrange a burial or cremation
• Parental responsibility applies

For losses before 24 weeks (miscarriage):
• No legal requirement to register the loss
• Some hospitals offer certificates of remembrance
• No automatic entitlement to maternity or paternity leave
• You may be entitled to sick leave
• The hospital can arrange cremation, or you can make private arrangements
• Some cemeteries have special areas for baby memorials

Legal documents and certificates:
• Medical certificate of stillbirth (for losses after 24 weeks)
• Certificate of pregnancy loss (may be offered for earlier losses)
• Registration of birth and death (for stillbirths)

Employment rights:
• Check your employment contract for compassionate leave provisions
• Consider flexible working requests if returning to full-time work is difficult
• Some employers have specific policies for pregnancy loss
• The Equality Act protects against discrimination related to pregnancy and maternity

Additional considerations:
• If a post-mortem is offered, you'll need to give written consent
• You have the right to see all medical records related to your care
• If you believe your care was inadequate, you have the right to make a complaint
• Some losses may qualify for special circumstances in future pregnancies

Remember that laws and entitlements may change, and some employers offer more generous provisions than the legal minimum. Seek current advice from citizens advice, ACAS, or specialist organizations like Sands if you have specific questions about your rights.
''';}