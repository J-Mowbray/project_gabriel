import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';
import 'package:gabrielsstar/components/navigation_card.dart';
import 'package:gabrielsstar/pages/resources_page.dart';
import 'package:gabrielsstar/pages/support_networks_page.dart';
import 'package:gabrielsstar/pages/types_of_loss_page.dart';
import 'package:gabrielsstar/pages/personal_stories_page.dart';
import 'package:gabrielsstar/pages/support_tips_page.dart';
import 'package:gabrielsstar/pages/awareness_page.dart';
import 'package:gabrielsstar/pages/privacy_policy_page.dart';

/// HomePage displays the main navigation screen for the Gabriel's Star app.
///
/// This screen provides access to all major sections of the application through
/// a grid of navigation cards, each leading to specialised content areas for
/// supporting families experiencing pregnancy and infant loss.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Signs the current user out of the application.
  ///
  /// Invokes Firebase Authentication to terminate the current session.
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gabriel's Star"),
        // AppBar styling is provided through AppBarTheme in the app's theme configuration
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with welcoming text
              Text(
                "Welcome to Gabriel's Star",
                style: AppTheme.pageTitleStyle(context),
              ),
              const SizedBox(height: 12),
              Text(
                "A supportive space for families experiencing pregnancy and infant loss. You are not alone.",
                style: AppTheme.bodyTextStyle(context),
              ),
              const SizedBox(height: 30),

              // Grid navigation system for accessing different app sections
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    // Resources navigation card - provides access to helpful materials and information
                    NavigationCard(
                      title: "Resources",
                      icon: Icons.lightbulb_outline,
                      color: AppTheme.resourcesCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResourcesPage(),
                            ),
                          ),
                    ),

                    // Support Networks navigation card - connects users to community and professional support
                    NavigationCard(
                      title: "Support Networks",
                      icon: Icons.people_outline,
                      color: AppTheme.supportNetworksCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SupportNetworksPage(),
                            ),
                          ),
                    ),

                    // Types of Loss navigation card - educates about different pregnancy and infant loss experiences
                    NavigationCard(
                      title: "Types of Loss",
                      icon: Icons.info_outline,
                      color: AppTheme.typesOfLossCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TypesOfLossPage(),
                            ),
                          ),
                    ),

                    // Personal Stories navigation card - provides access to shared experiences from other families
                    NavigationCard(
                      title: "Personal Stories",
                      icon: Icons.book_outlined,
                      color: AppTheme.personalStoriesCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PersonalStoriesPage(),
                            ),
                          ),
                    ),

                    // Support Tips navigation card - offers guidance on supporting grieving families
                    NavigationCard(
                      title: "Support Tips",
                      icon: Icons.favorite_outline,
                      color: AppTheme.supportTipsCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SupportTipsPage(),
                            ),
                          ),
                    ),

                    // Awareness navigation card - provides resources for advocacy and raising public awareness
                    NavigationCard(
                      title: "Raising Awareness",
                      icon: Icons.campaign_outlined,
                      color: AppTheme.awarenessCardColor,
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AwarenessPage(),
                            ),
                          ),
                    ),
                  ],
                ),
              ),

              // Privacy Policy link at the bottom
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
