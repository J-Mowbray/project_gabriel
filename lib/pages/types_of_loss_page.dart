import 'package:flutter/material.dart';
import 'package:gabrielsstar/components/base_page_layout.dart';
import 'package:gabrielsstar/components/content_card.dart';
import 'package:gabrielsstar/theme/theme_config.dart';

/// TypesOfLossPage provides educational information about different forms of
/// pregnancy and infant loss.
///
/// This page presents various types of loss with brief descriptions in cards that
/// expand to provide more detailed medical information when tapped. The content
/// aims to help users understand the medical aspects of their loss experience.
class TypesOfLossPage extends StatelessWidget {
  const TypesOfLossPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BasePageLayout(
      title: 'Types of Loss',
      child: ListView(
        children: [
          const SizedBox(height: 8),
          Text(
            'Understanding Different Types of Loss',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Pregnancy and infant loss can occur in different ways. Understanding the medical aspects of your loss may help with processing what happened. This information is provided for educational purposes and support.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Please remember that whatever type of loss you experienced, your grief is valid and you deserve support.',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Information about miscarriage - loss before 24 weeks gestation
          ContentCard(
            title: 'Miscarriage',
            content: 'The loss of a pregnancy before 24 weeks of gestation.',
            icon: Icons.info_outline,
            iconColor: AppTheme.typesOfLossCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Miscarriage',
                  _miscarriageContent,
                  AppTheme.typesOfLossCardColor,
                ),
          ),

          // Information about stillbirth - loss after 24 weeks gestation
          ContentCard(
            title: 'Stillbirth',
            content:
                'When a baby is born deceased after 24 weeks of pregnancy.',
            icon: Icons.info_outline,
            iconColor: AppTheme.resourcesCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Stillbirth',
                  _stillbirthContent,
                  AppTheme.resourcesCardColor,
                ),
          ),

          // Information about ectopic pregnancy - implantation outside uterus
          ContentCard(
            title: 'Ectopic Pregnancy',
            content:
                'When a fertilised egg implants outside the uterus, most commonly in a fallopian tube.',
            icon: Icons.info_outline,
            iconColor: AppTheme.personalStoriesCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Ectopic Pregnancy',
                  _ectopicContent,
                  AppTheme.personalStoriesCardColor,
                ),
          ),

          // Information about molar pregnancy - abnormal growth instead of embryo
          ContentCard(
            title: 'Molar Pregnancy',
            content:
                'A rare complication where tissue that normally becomes a foetus instead becomes an abnormal growth in the uterus.',
            icon: Icons.info_outline,
            iconColor: AppTheme.awarenessCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Molar Pregnancy',
                  _molarContent,
                  AppTheme.awarenessCardColor,
                ),
          ),

          // Information about TFMR - ending pregnancy for medical reasons
          ContentCard(
            title: 'Termination for Medical Reasons (TFMR)',
            content:
                'The difficult decision to end a wanted pregnancy due to severe foetal abnormalities or risks to maternal health.',
            icon: Icons.info_outline,
            iconColor: AppTheme.supportTipsCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Termination for Medical Reasons (TFMR)',
                  _tfmrContent,
                  AppTheme.supportTipsCardColor,
                ),
          ),

          // Information about neonatal death - loss within first 28 days of life
          ContentCard(
            title: 'Neonatal Death',
            content:
                'The death of a newborn baby within the first 28 days of life.',
            icon: Icons.info_outline,
            iconColor: AppTheme.supportNetworksCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Neonatal Death',
                  _neonatalContent,
                  AppTheme.supportNetworksCardColor,
                ),
          ),

          // Information about SIDS - unexpected infant death during sleep
          ContentCard(
            title: 'Sudden Infant Death Syndrome (SIDS)',
            content:
                'The unexplained death of a seemingly healthy baby, usually during sleep.',
            icon: Icons.info_outline,
            iconColor: AppTheme.typesOfLossCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Sudden Infant Death Syndrome (SIDS)',
                  _sidsContent,
                  AppTheme.typesOfLossCardColor,
                ),
          ),

          // Information about early pregnancy loss - first trimester losses
          ContentCard(
            title: 'Early Pregnancy Loss',
            content:
                'Loss that occurs in the first trimester (first 12 weeks) of pregnancy.',
            icon: Icons.info_outline,
            iconColor: AppTheme.resourcesCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Early Pregnancy Loss',
                  _earlyLossContent,
                  AppTheme.resourcesCardColor,
                ),
          ),

          // Information about recurrent pregnancy loss - multiple consecutive losses
          ContentCard(
            title: 'Recurrent Pregnancy Loss',
            content:
                'The experience of three or more consecutive pregnancy losses.',
            icon: Icons.info_outline,
            iconColor: AppTheme.personalStoriesCardColor,
            onTap:
                () => _showLossDetail(
                  context,
                  'Recurrent Pregnancy Loss',
                  _recurrentLossContent,
                  AppTheme.personalStoriesCardColor,
                ),
          ),
        ],
      ),
    );
  }

  /// Displays detailed information about a specific type of loss in a modal bottom sheet.
  ///
  /// Creates a draggable, scrollable sheet with comprehensive medical information
  /// about the selected loss type. The sheet includes a styled header with the
  /// loss type name and an information icon.
  ///
  /// Parameters:
  ///   context - The build context
  ///   title - The name of the loss type
  ///   content - The detailed medical information text to display
  ///   iconColor - The colour to apply to the header (visual category indicator)
  void _showLossDetail(
    BuildContext context,
    String title,
    String content,
    Color iconColor,
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
                // Modal header with loss type title and information icon
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
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
                // Scrollable content area for the detailed medical information
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.all(16),
                    children: [Text(content, style: theme.textTheme.bodyLarge)],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Medical information about miscarriage.
  ///
  /// Provides details about the definition, types, symptoms, causes, and
  /// management of miscarriage, which is pregnancy loss before 24 weeks gestation.
  static const String _miscarriageContent = '''
Miscarriage is the most common type of pregnancy loss, affecting approximately 1 in 4 pregnancies. While it's often defined medically as loss before 24 weeks, many healthcare providers further categorise miscarriages:

Types of miscarriage:
• Complete miscarriage: All pregnancy tissue has been passed
• Incomplete miscarriage: Some pregnancy tissue remains in the uterus
• Missed miscarriage: The pregnancy has stopped developing but hasn't been physically passed
• Threatened miscarriage: Bleeding suggests possible miscarriage, but the pregnancy continues
• Blighted ovum (anembryonic pregnancy): A fertilised egg implants but doesn't develop into an embryo

Common symptoms include:
• Vaginal bleeding or spotting
• Cramping or pain in the lower abdomen
• Passing tissue or clots
• Decrease in pregnancy symptoms

Most miscarriages occur in the first trimester and are due to chromosomal abnormalities that happen by chance during fertilisation or early cell division. Other causes may include:
• Structural issues with the uterus or cervix
• Certain medical conditions like uncontrolled diabetes or thyroid disease
• Advanced maternal age
• Certain infections
• Environmental factors or exposures

It's important to know that most miscarriages are not preventable and are not caused by normal activities like moderate exercise, working, sexual intercourse, or minor falls.

Medical management may include:
• Expectant management (waiting for the body to naturally complete the miscarriage)
• Medical management (medications to help complete the miscarriage)
• Surgical management (procedure to remove remaining pregnancy tissue)

A follow-up appointment is typically recommended to ensure complete recovery.

Facts to remember:
• Having a miscarriage does not mean you can't have a healthy pregnancy in the future
• Most people who experience one miscarriage go on to have a successful pregnancy next time
• Support is available to help you through this difficult experience
''';

  /// Medical information about stillbirth.
  ///
  /// Provides details about the definition, causes, hospital protocols, physical
  /// recovery, and support options for stillbirth, which is loss after 24 weeks gestation.
  static const String _stillbirthContent = '''
Stillbirth is defined as the birth of a baby who has died before or during delivery after 24 weeks of pregnancy. In the UK, approximately 1 in every 250 pregnancies ends in stillbirth.

When stillbirth occurs, you will go through labour and delivery. The hospital staff will provide options for spending time with your baby, creating memories, and arranging funeral services.

Possible causes include:
• Placental complications
• Birth defects
• Growth restriction
• Umbilical cord issues
• Infections
• Maternal health conditions
• Multiple pregnancies

However, in many cases, the cause remains unknown despite investigation.

After a stillbirth, you may be offered:
• Post-mortem examination to help determine the cause
• Blood tests and other investigations
• Genetic testing if appropriate
• Detailed review of your pregnancy history

Understanding what happened, if possible, can help with closure and may provide important information for future pregnancies.

The physical recovery process is similar to recovery after live birth. You may experience:
• Postpartum bleeding (lochia)
• Breast milk production
• Physical discomfort from delivery
• Hormonal changes affecting mood and emotions

Hospitals usually offer follow-up appointments to discuss test results and provide support. Many hospitals have specialised bereavement services for families experiencing stillbirth.

Support after stillbirth:
• Specialised bereavement midwives or nurses
• Hospital chaplains or spiritual care
• Memory-making opportunities (photographs, handprints, locks of hair)
• Support groups specifically for stillbirth
• Counselling services

It's important to know that many people who experience stillbirth do go on to have subsequent healthy pregnancies, often with additional monitoring and support.
''';

  /// Medical information about ectopic pregnancy.
  ///
  /// Provides details about the definition, symptoms, risk factors, treatment
  /// options, and recovery for ectopic pregnancy, when implantation occurs outside the uterus.
  static const String _ectopicContent = '''
An ectopic pregnancy occurs when a fertilised egg implants and grows outside the main cavity of the uterus, most commonly in a fallopian tube. This type of pregnancy cannot proceed normally and requires medical intervention.

In the UK, around 1 in 90 pregnancies is ectopic.

Symptoms typically appear between weeks 4 and 12 of pregnancy and may include:
• One-sided lower abdominal pain
• Vaginal bleeding or spotting
• Shoulder tip pain (caused by internal bleeding irritating the diaphragm)
• Dizziness or fainting
• Bowel or bladder pain

An ectopic pregnancy is a medical emergency if the fallopian tube ruptures, causing internal bleeding.

Risk factors include:
• Previous ectopic pregnancy
• Previous fallopian tube surgery
• Certain contraceptive methods (failures of IUDs or progesterone-only pills)
• History of pelvic inflammatory disease or sexually transmitted infections
• Endometriosis
• Smoking
• Advanced maternal age
• Fertility treatments

Treatment options depend on how far the pregnancy has progressed and your symptoms:
• Medication (methotrexate) to stop the pregnancy developing
• Laparoscopic (keyhole) surgery
• Emergency surgery if rupture has occurred

Physical recovery typically takes a few weeks, though emotional recovery may take much longer. It's recommended to wait for at least two menstrual cycles before trying to conceive again.

Follow-up care is important to:
• Ensure HCG levels return to zero
• Check for any complications
• Discuss implications for future pregnancies
• Address emotional needs

Most women who have had an ectopic pregnancy can go on to have a normal pregnancy in the future, though there is a slightly higher risk of another ectopic pregnancy.
''';

  /// Medical information about molar pregnancy.
  ///
  /// Provides details about the definition, types, symptoms, diagnosis, treatment,
  /// and follow-up care for molar pregnancy, an abnormal growth instead of normal embryo development.
  static const String _molarContent = '''
A molar pregnancy (also called hydatidiform mole) is a rare complication where tissue that normally becomes a foetus instead develops into an abnormal growth in the uterus. It's a type of gestational trophoblastic disease (GTD).

There are two types:
• Complete molar pregnancy: No foetal tissue develops, and all the placental tissue is abnormal
• Partial molar pregnancy: Some normal placental tissue develops alongside the abnormal tissue, and there may be some foetal development, though not viable

Symptoms may include:
• Vaginal bleeding in early pregnancy
• Severe nausea and vomiting (more severe than typical morning sickness)
• High blood pressure early in pregnancy
• Passing grape-like tissue
• Unusually high hCG levels
• Larger than expected uterine size for gestational age

Diagnosis is typically made through:
• Ultrasound showing characteristic "snowstorm" appearance
• Blood tests showing abnormally high hCG levels
• Examination of tissue passed or removed

Treatment involves removing the abnormal tissue, usually through:
• Vacuum aspiration (D&C procedure)
• Sometimes followed by medication if tissue remains

After treatment, follow-up is essential:
• Regular monitoring of hCG levels to ensure they return to normal
• Usually advised to avoid pregnancy during this monitoring period (typically 6-12 months)
• Contraception is recommended during this time

In most cases, hCG levels decline normally and no further treatment is needed.

A small percentage (about 15% of complete moles and 0.5-1% of partial moles) may develop persistent GTD, which requires additional treatment, possibly including chemotherapy.

After one molar pregnancy:
• Risk of recurrence is about 1 in 80 (compared to 1 in 1,000 in the general population)
• Most women go on to have normal pregnancies afterward
• Early ultrasound is recommended in subsequent pregnancies

Support is available through specialised follow-up clinics and organisations focused on this rare condition.
''';

  /// Medical information about termination for medical reasons.
  ///
  /// Provides details about the definition, reasons, decision process, procedures,
  /// and support options for termination of pregnancy due to medical indications.
  static const String _tfmrContent = '''
Termination for Medical Reasons (TFMR) refers to ending a wanted pregnancy due to severe foetal abnormalities or to protect the mother's health. This is one of the most difficult decisions parents may face.

Reasons for TFMR may include:
• Severe or fatal foetal anomalies discovered during screening or diagnostic tests
• Conditions incompatible with life or that would lead to significant suffering
• Maternal health conditions where continuing the pregnancy poses serious risks

The decision process typically involves:
• Extensive testing to confirm diagnosis (ultrasounds, amniocentesis, CVS, genetic testing)
• Consultations with specialists (maternal-foetal medicine, genetics, paediatric specialists)
• Discussions about prognosis and quality of life
• Consideration of personal, family, ethical, and sometimes religious factors

Procedures may include:
• Medical termination (using medications to induce labour)
• Surgical procedures (D&E - dilation and evacuation)

The method used often depends on the gestational age and other medical factors.

Many hospitals offer:
• Memory-making opportunities similar to those offered for other types of loss
• Naming and holding the baby
• Photographs and mementos
• Options for burial or cremation
• Genetic testing and post-mortem examination if desired

The grief following TFMR can be complicated by:
• The active decision-making role parents take
• Potential feelings of guilt despite making the most compassionate choice
• Social stigma and misunderstanding
• Limited support resources specific to this type of loss

Support resources include:
• Specialised support groups for families who have experienced TFMR
• Genetic counselling for future pregnancy planning
• Bereavement counselling

It's important to know that many families who experience TFMR do go on to have healthy pregnancies in the future, often with additional prenatal testing and monitoring.
''';

  /// Medical information about neonatal death.
  ///
  /// Provides details about the definition, causes, hospital care, memory-making,
  /// and support options for the death of a baby within the first 28 days of life.
  static const String _neonatalContent = '''
Neonatal death refers to the death of a baby within the first 28 days after birth. This period is further divided into early neonatal death (first 7 days) and late neonatal death (days 8-28).

In the UK, neonatal deaths occur in approximately 2.8 per 1,000 live births.

Common causes include:
• Complications of prematurity
• Birth defects or genetic conditions
• Birth trauma
• Infections
• Sudden unexpected postnatal collapse

When a baby is critically ill after birth:
• They may be cared for in a Neonatal Intensive Care Unit (NICU)
• Parents are encouraged to be involved in care decisions
• Medical teams provide information about prognosis and treatment options
• Palliative care may be offered when treatment is not possible

Many hospitals provide:
• Opportunity to hold and spend time with your baby
• Memory-making activities (photographs, handprints, locks of hair)
• Support from specialised bereavement staff
• Private family rooms for saying goodbye
• Spiritual or religious ceremonies if desired
• Help with funeral arrangements

After returning home:
• Follow-up appointments with medical teams
• Post-mortem results discussion if applicable
• Referrals to bereavement services
• Support groups specifically for parents who have experienced neonatal loss

The physical recovery for the mother will be similar to recovery after any birth, with the added challenge of grief. Physical symptoms may include:
• Postpartum bleeding
• Breast milk production
• Healing from delivery
• Fatigue from grief and physical recovery

Partners and siblings will also need support during this time, and family-centred bereavement care is important.

Organisations like Sands provide specialised support for families experiencing neonatal death.
''';

  /// Medical information about Sudden Infant Death Syndrome.
  ///
  /// Provides details about the definition, risk factors, emergency protocols,
  /// support after loss, and safe sleep guidelines to reduce SIDS risk.
  static const String _sidsContent = '''
Sudden Infant Death Syndrome (SIDS), sometimes called cot death, is the sudden, unexpected death of a seemingly healthy baby, usually during sleep, that remains unexplained even after thorough investigation.

In the UK, SIDS affects approximately 1 in 3,000 babies.

While the exact cause of SIDS is unknown, research has identified several risk factors:
• Sleeping position (babies who sleep on their stomach or side have higher risk)
• Overheating
• Soft bedding, pillows, or toys in the sleeping area
• Exposure to tobacco smoke
• Sharing a sleep surface, particularly with adults who are extremely tired, have consumed alcohol or drugs, or on sofas/armchairs
• Prematurity or low birth weight

When SIDS occurs:
• Emergency services should be called immediately
• Medical professionals will try to resuscitate the baby
• The baby will be taken to hospital
• Police involvement is standard procedure but does not imply suspicion
• A thorough investigation will take place to try to determine the cause

After the loss:
• Parents may experience intense grief complicated by shock and sometimes guilt
• Support from specialised bereavement services is available
• Post-mortem examination may be conducted
• Coroner's inquest may be held
• Support organisations specifically for SIDS bereavement exist

For subsequent children:
• Parents often experience heightened anxiety
• Medical monitoring equipment may be offered
• Counselling and support can help manage anxiety
• Following safe sleep guidelines remains important

While nothing can guarantee prevention of SIDS, the "Safer Sleep" guidelines recommended by organisations like The Lullaby Trust can significantly reduce the risk:
• Always place baby on their back to sleep
• Keep baby in a smoke-free environment
• Place baby in their own sleep space with a firm, flat mattress
• Keep baby's head uncovered and feet at the bottom of the cot
• Breastfeed if possible
• Room-share (but not bed-share) for the first 6 months
• Avoid overheating
• Keep the sleep space clear of pillows, toys, and loose bedding
''';

  /// Medical information about early pregnancy loss.
  ///
  /// Provides details about the definition, frequency, symptoms, causes, management,
  /// and recovery for losses occurring within the first 12 weeks of pregnancy.
  static const String _earlyLossContent = '''
Early pregnancy loss occurs in the first trimester (first 12 weeks) of pregnancy. This category includes chemical pregnancies, which are very early miscarriages that occur shortly after implantation.

Early pregnancy loss is extremely common:
• Approximately 1 in 4 known pregnancies end in miscarriage
• Many early losses occur before a woman knows she is pregnant
• The majority of early losses occur before 8 weeks

Symptoms may include:
• Light to heavy bleeding
• Cramping
• Passing of tissue
• Lessening of pregnancy symptoms

Common causes include:
• Chromosomal abnormalities (accounts for approximately 50-60% of early losses)
• Implantation issues
• Hormonal imbalances
• Maternal health conditions
• Structural issues with the uterus or cervix

Medical management may include:
• Expectant management (waiting for the miscarriage to complete naturally)
• Medical management (medications like misoprostol)
• Surgical management (vacuum aspiration or D&C)

Recovery typically involves:
• Physical healing over 1-2 weeks
• Return of normal menstrual cycle within 4-6 weeks
• Emotional healing, which varies greatly among individuals

Early pregnancy loss often receives less social recognition than later losses, which can leave parents feeling that their grief is minimised or invalidated. However, the emotional impact can be profound regardless of how early the loss occurred.

Support after early loss:
• Acknowledge the validity of grief regardless of gestation
• Connect with others who understand this experience
• Consider rituals or ways to remember the pregnancy
• Be gentle with yourself during the physical and emotional recovery
• Seek professional support if grief becomes overwhelming

Most women who experience early pregnancy loss go on to have successful pregnancies. After one early loss, there is usually no need for specialised testing before trying again.
''';

  /// Medical information about recurrent pregnancy loss.
  ///
  /// Provides details about the definition, emotional impact, and medical
  /// investigations for those experiencing multiple consecutive pregnancy losses.
  static const String _recurrentLossContent = '''
Recurrent pregnancy loss (RPL) is typically defined as three or more consecutive pregnancy losses. It affects approximately 1-2% of couples trying to conceive.

When diagnosed with RPL, the emotional impact can be particularly difficult:
• Heightened anxiety with each subsequent pregnancy
• Growing sense of frustration or helplessness
• Relationship strain
• Fear of hoping or bonding with future pregnancies

Medical investigation is usually recommended after three losses, though some providers may begin testing after two, especially if other risk factors are present. Investigations may include:

• Genetic testing:
  - Karyotyping of both partners
  - Testing of pregnancy tissue when possible

• Anatomical assessment:
  - Ultrasound
  - Hysteroscopy
  - 3D sonography or MRI in some cases

• Hormonal evaluation:
  - Thyroid function
  - Prolactin levels
  - Luteal phase assessment

• Blood clotting disorders:
  - Antiphospholipid syndrome testing
  - Factor V Leiden and other thrombophilia testing

• Immunological factors:
  - Natural killer cell testing (in some specialist clinics)
  - Autoimmune disorder screening

• Lifestyle factors assessment:
  - BMI evaluation
  - Smoking and alcohol consumption
  - Environmental exposures

Potential causes of recurrent pregnancy loss include:
• Chromosomal abnormalities (in either partner)
• Uterine abnormalities (septum, fibroids, polyps)
• Blood clotting disorders
• Hormonal imbalances
• Immunological factors
• Chronic endometritis (uterine inflammation)
• Lifestyle factors

However, in approximately 50% of cases, no definitive cause is found despite thorough investigation. This can be particularly frustrating, but doesn't mean that future pregnancies won't be successful.

Treatment options depend on identified causes:
• Surgery for certain uterine abnormalities
• Blood thinners for clotting disorders
• Hormone supplementation for certain imbalances
• Management of underlying medical conditions
• Lifestyle modifications
• In some cases, assisted reproductive technologies

When no cause is found, supportive care with early and frequent monitoring in subsequent pregnancies is typically recommended. This includes:
• Early ultrasounds to confirm viability
• Hormone level monitoring
• Regular check-ups with a specialist
• Emotional support and counselling

Success rates after recurrent losses:
• Without intervention, 60-75% of women with unexplained RPL will have a successful next pregnancy
• With appropriate treatment for identified causes, success rates may be higher
• The chances of success may decrease with maternal age and number of previous losses

Support is crucial when experiencing recurrent pregnancy loss. Organisations like Tommy's, The Miscarriage Association, and specialised recurrent miscarriage clinics offer resources specifically for those dealing with multiple losses.
''';
}
