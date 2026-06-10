import 'package:design_resposivo/animations.dart';
import 'package:design_resposivo/destinations.dart';
import 'package:design_resposivo/transitions/nav_rail_transition.dart';
import 'package:design_resposivo/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail({
    super.key,
    required this.railAnimation,
    required this.railFabAnimation,
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation;
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        leading: Column(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            const SizedBox(height: 9),
            AnimatedFloatingActionButton(
              animation: railFabAnimation,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
        groupAlignment: -0.85,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}
