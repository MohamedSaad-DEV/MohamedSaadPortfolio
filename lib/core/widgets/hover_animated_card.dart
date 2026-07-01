import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/ui_constants.dart';

class HoverAnimatedCard extends StatefulWidget {
  const HoverAnimatedCard({
    required this.child,
    required this.decoration,
    this.hoverAccentColor = UIConstants.primaryBlue,
    this.padding,
    this.duration = const Duration(milliseconds: 250),
    super.key,
  });

  final Widget child;
  final BoxDecoration decoration;
  final Color hoverAccentColor;
  final EdgeInsetsGeometry? padding;
  final Duration duration;

  @override
  State<HoverAnimatedCard> createState() => _HoverAnimatedCardState();
}

class _HoverAnimatedCardState extends State<HoverAnimatedCard> {
  bool _isHovered = false;

  BoxDecoration get _currentDecoration {
    if (!_isHovered) return widget.decoration;

    return widget.decoration.copyWith(
      border: Border.all(
        color: widget.hoverAccentColor.withValues(alpha: 0.55),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: widget.hoverAccentColor.withValues(alpha: 0.22),
          blurRadius: 28,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -4.h : 0, 0),
          padding: widget.padding,
          decoration: _currentDecoration,
          child: widget.child,
        ),
      ),
    );
  }
}
