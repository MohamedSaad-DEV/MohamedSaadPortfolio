import 'package:flutter/material.dart';

abstract final class UIConstants {
  // Brand palette — charcoal, slate, cool blue (matches portrait aesthetic)
  static const Color backgroundDark = Color(0xFF0B0E14);
  static const Color backgroundMid = Color(0xFF12161F);
  static const Color surface = Color(0xFF1A2030);
  static const Color surfaceLight = Color(0xFF242B3D);
  static const Color primaryBlue = Color(0xFF4A90D9);
  static const Color accentCyan = Color(0xFF5BC0EB);
  static const Color accentGold = Color(0xFFD4AF37);
  static const Color textPrimary = Color(0xFFF0F4FA);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color border = Color(0xFF2D3748);
  static const Color success = Color(0xFF34D399);
  static const Color error = Color(0xFFF87171);

  static const double maxContentWidth = 1200;
  static const double sectionVerticalPadding = 80;
  static const double horizontalPadding = 24;

  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(16));
  static const BorderRadius chipRadius = BorderRadius.all(Radius.circular(8));

  static BoxDecoration glassCardDecoration = BoxDecoration(
    color: surface.withValues(alpha: 0.7),
    borderRadius: cardRadius,
    border: Border.all(color: border.withValues(alpha: 0.6)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.3),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static LinearGradient heroGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [backgroundDark, backgroundMid, Color(0xFF151C2C)],
  );

  static LinearGradient accentGradient = const LinearGradient(
    colors: [primaryBlue, accentCyan],
  );
}
