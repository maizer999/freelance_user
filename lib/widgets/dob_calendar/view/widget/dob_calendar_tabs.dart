import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DobCalendarTabs extends StatelessWidget implements PreferredSizeWidget {
  const DobCalendarTabs({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
        ),
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: context.theme.colorScheme.onSurface,
          labelStyle: const TextStyle(fontWeight: FontWeight.w400),
          unselectedLabelColor:
              context.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: Color(0xFFe52688)),
            insets: EdgeInsetsDirectional.only(start: 8, end: 8),
          ),
          tabs: [
            Tab(text: "GREGORIAN"),
            Tab(text: "HIJRI"),
          ],
        ).objectTopLeft(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
