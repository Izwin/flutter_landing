import 'package:devvibe_landing/features/presentation/widgets/background_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/contact_section_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/features_section_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/footer_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/hero_section_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/navbar_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/portfolio_section_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/reviews_section_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/youtube_section_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _reviewsKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _youtubeKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToWidget(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                NavbarWidget(
                  onServicesPressed: (){
                    scrollToWidget(_servicesKey);
                  },
                  onReviewsPressed: (){
                    scrollToWidget(_reviewsKey);
                  },
                  onYoutubePressed: (){
                    scrollToWidget(_youtubeKey);
                  },
                  onPortfolioPressed: (){
                    scrollToWidget(_portfolioKey);
                  },
                  onContactPressed: (){
                    scrollToWidget(_contactKey);
                  },
                ),
                HeroSectionWidget(
                  scrollToContacts: (){
                    scrollToWidget(_contactKey);
                  },
                ),
                FeaturesSectionWidget(servicesKey: _servicesKey),
                PortfolioSectionWidget(portfolioKey: _portfolioKey),
                ReviewsSectionWidget(reviewsKey: _reviewsKey),
                YoutubeSectionWidget(youtubeKey: _youtubeKey),
                ContactSectionWidget(contactFormKey: _contactKey),
                FooterWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
