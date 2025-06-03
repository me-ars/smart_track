import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_track/view/login/login_view.dart';

import '../constants/route_Constants.dart';
import '../services/auth_service/auth_service.dart';
import '../state_providers/login/login_bloc.dart';

class AppRouter{

static final  appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginBloc(authService: AuthService()),
          child: LoginView(),
        );
      },
    ),
    // GoRoute(
    //   path: '/admin_dashboard',
    //   builder: (context, state) => const AdminDashboard(),
    // ),
    // GoRoute(
    //   path: '/parent_dashboard',
    //   builder: (context, state) => const ParentDashboard(),
    // ),
    // GoRoute(
    //   path: '/student_dashboard',
    //   builder: (context, state) => const StudentDashboard(),
    // ),
  ],
);}