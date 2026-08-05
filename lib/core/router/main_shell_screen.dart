import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/ds_bottom_nav.dart';

/// Branch index ↔ tab mapping — must mirror the branch order declared in
/// [AppRouter.router]'s `StatefulShellRoute.indexedStack`.
const List<DsBottomNavTab> _kShellTabs = [
  DsBottomNavTab.home,
  DsBottomNavTab.policies,
  DsBottomNavTab.claims,
  DsBottomNavTab.profile,
];

/// Persistent bottom-nav shell for the 4 main tabs (Home / Policies / Claims
/// / Profile). Each branch keeps its own nested [Navigator] alive via
/// [StatefulShellRoute.indexedStack] — switching tabs preserves scroll
/// position and any local widget state instead of rebuilding from scratch.
class MainShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DsBottomNav(
        active: _kShellTabs[navigationShell.currentIndex],
        onChanged: (tab) {
          final index = _kShellTabs.indexOf(tab);
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
