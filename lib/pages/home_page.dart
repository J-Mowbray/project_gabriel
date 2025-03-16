import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gabrielsstar/theme/theme_config.dart';
import 'package:gabrielsstar/components/navigation_card.dart'; // Import your NavigationCard widget
import 'package:gabrielsstar/pages/resources_page.dart';
import 'package:gabrielsstar/pages/support_networks_page.dart';
import 'package:gabrielsstar/pages/types_of_loss_page.dart';
import 'package:gabrielsstar/pages/personal_stories_page.dart';
import 'package:gabrielsstar/pages/support_tips_page.dart';
import 'package:gabrielsstar/pages/awareness_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // log user out
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gabriel's Star"),
        // No need to specify styling - comes from AppBarTheme
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
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
              
              // Main navigation grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    // Resources section - using predefine theme colors
                    NavigationCard(
                      title: "Resources",
                      icon: Icons.lightbulb_outline,
                      color: AppTheme.resourcesCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResourcesPage(),
                        ),
                      ),
                    ),
                    
                    // Support Networks section
                    NavigationCard(
                      title: "Support Networks",
                      icon: Icons.people_outline,
                      color: AppTheme.supportNetworksCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SupportNetworksPage(),
                        ),
                      ),
                    ),
                    
                    // Types of Loss section
                    NavigationCard(
                      title: "Types of Loss",
                      icon: Icons.info_outline,
                      color: AppTheme.typesOfLossCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TypesOfLossPage(),
                        ),
                      ),
                    ),
                    
                    // Personal Stories section
                    NavigationCard(
                      title: "Personal Stories",
                      icon: Icons.book_outlined,
                      color: AppTheme.personalStoriesCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalStoriesPage(),
                        ),
                      ),
                    ),
                    
                    // Support Tips section
                    NavigationCard(
                      title: "Support Tips",
                      icon: Icons.favorite_outline,
                      color: AppTheme.supportTipsCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SupportTipsPage(),
                        ),
                      ),
                    ),
                    
                    // Awareness section
                    NavigationCard(
                      title: "Raising Awareness",
                      icon: Icons.campaign_outlined,
                      color: AppTheme.awarenessCardColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AwarenessPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}