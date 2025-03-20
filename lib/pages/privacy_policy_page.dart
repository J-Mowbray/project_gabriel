import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                'Privacy Policy for Gabriel\'s Star',
                'This Privacy Policy explains how Gabriel\'s Star handles your personal information when you use our application. We are committed to protecting your privacy and ensuring that your personal data is handled with care and in accordance with applicable data protection laws, including the General Data Protection Regulation (GDPR).',
                theme,
              ),

              _buildSection(
                'Authentication and Data Processing',
                'Gabriel\'s Star uses Google Firebase Authentication to manage user accounts and authentication. When you register for an account:\n\n• Your email address is collected and stored by Google Firebase Authentication\n• We do not separately collect, store, or process this information on our own servers\n• Your authentication data is processed solely for the purpose of allowing you to create and access your account within our application',
                theme,
              ),

              _buildSection(
                'Third-Party Service Provider',
                'Google Firebase acts as a data processor for authentication information. For information about how Google processes your data, please review Google\'s Privacy Policy at: https://policies.google.com/privacy',
                theme,
              ),

              _buildSection(
                'Data We Access',
                'When you log in to Gabriel\'s Star:\n• We receive a unique identifier from Firebase that allows us to recognise your account\n• We do not receive or store your email address or authentication details within our own systems',
                theme,
              ),

              _buildSection(
                'Legal Basis for Processing',
                'Our processing of your authentication data is based on:\n• Your explicit consent when creating an account\n• The necessity to perform our contract with you (providing secure access to the application\'s features)',
                theme,
              ),

              _buildSection(
                'Data Security',
                'While we do not directly store your authentication data, we have implemented appropriate security measures within our application to protect your privacy, including:\n• Secure communication with Firebase Authentication services\n• Proper handling of authentication tokens\n• Implementation of secure session management',
                theme,
              ),

              _buildSection(
                'Your Rights',
                'Under the GDPR, you have the following rights regarding your personal data:\n• Right to access: You can request information about how we process your data\n• Right to erasure: You can delete your account through the application settings\n• Right to object: You can object to our processing by discontinuing use of the application\n• Right to withdraw consent: You can withdraw your consent by deleting your account',
                theme,
              ),

              _buildSection(
                'Data Retention',
                'If you choose to delete your account:\n• We will remove your account association from our application\n• Your authentication data in Firebase will be handled according to Google\'s data retention policies',
                theme,
              ),

              _buildSection(
                'Age Restrictions and Young Parents',
                'Gabriel\'s Star is primarily designed for adults who have experienced pregnancy or infant loss. While we recognise that individuals may legally become parents from the age of 16 in the UK, our general policy is that users should be 18 years or older.\n\nHowever, we acknowledge that younger individuals who have experienced pregnancy or infant loss may benefit from our resources. If you are between 16-17 years old and have experienced such loss, you may use our service, but we encourage you to review this privacy policy with a parent, guardian, or other trusted adult.\n\nWe do not knowingly collect personal information from anyone under 16 years of age. If we learn that we have inadvertently gathered personal information from someone under 16, we will take appropriate steps to delete this information.\n\nIf you believe someone under the age of 16 may have provided us with their personal information, please contact us immediately at support@gabriels-star.org.',
                theme,
              ),

              _buildSection(
                'Changes to This Policy',
                'We may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any material changes through the application.',
                theme,
              ),

              _buildSection(
                'Contact Information',
                'If you have any questions about this Privacy Policy, our data practices or wish to delete your account, please contact us at support@gabriels-star.org\n\nLast updated: March 1, 2025',
                theme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(content, style: const TextStyle(fontSize: 14.0, height: 1.5)),
        ],
      ),
    );
  }
}
