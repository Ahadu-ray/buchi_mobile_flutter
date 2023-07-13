import 'package:buchi_mobile_flutter/shared/themes/app_theme.dart';
import 'package:buchi_mobile_flutter/ui/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class PageWithAppBar extends StatefulWidget {
  const PageWithAppBar({super.key, required this.child});

  final Widget child;

  @override
  State<PageWithAppBar> createState() => _PagWwithAppBarState();
}

class _PagWwithAppBarState extends State<PageWithAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(children: [CustomAppBar(), widget.child]),
    );
  }
}
