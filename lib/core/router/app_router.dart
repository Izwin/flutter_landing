import 'package:devvibe_landing/features/presentation/pages/home_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(routes: [
  GoRoute(path: HomePage.path,builder: (context,state){
    return HomePage();
  },),
],initialLocation: HomePage.path,observers: [
  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
]);