import 'package:flutter/material.dart';
import 'package:smart_track/core/navigation/app_router.dart';

class SmartTrack extends StatelessWidget {
  const SmartTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter
    );
  }
}
