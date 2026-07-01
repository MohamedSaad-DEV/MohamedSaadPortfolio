import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';

class TechParticlesBackground extends StatefulWidget {
  const TechParticlesBackground({super.key});

  @override
  State<TechParticlesBackground> createState() => _TechParticlesBackgroundState();
}

class _TechParticlesBackgroundState extends State<TechParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random(42);
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
    _particles = List.generate(18, (_) => _Particle.random(_random));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _ParticlesPainter(
            progress: _controller.value,
            particles: _particles,
            labels: PortfolioData.techBackgroundIcons,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.labelIndex,
    required this.opacity,
  });

  final double x;
  final double y;
  final double speed;
  final double size;
  final int labelIndex;
  final double opacity;

  factory _Particle.random(Random random) {
    return _Particle(
      x: random.nextDouble(),
      y: random.nextDouble(),
      speed: 0.02 + random.nextDouble() * 0.04,
      size: 10 + random.nextDouble() * 14,
      labelIndex: random.nextInt(PortfolioData.techBackgroundIcons.length),
      opacity: 0.04 + random.nextDouble() * 0.08,
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  _ParticlesPainter({
    required this.progress,
    required this.particles,
    required this.labels,
  });

  final double progress;
  final List<_Particle> particles;
  final List<String> labels;

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final yOffset = (particle.y + progress * particle.speed) % 1.0;
      final xPos = particle.x * size.width;
      final yPos = yOffset * size.height;

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[particle.labelIndex],
          style: GoogleFonts.jetBrainsMono(
            fontSize: particle.size,
            color: UIConstants.primaryBlue.withValues(alpha: particle.opacity),
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset(xPos, yPos));
    }

    // Subtle grid overlay
    final gridPaint = Paint()
      ..color = UIConstants.border.withValues(alpha: 0.04)
      ..strokeWidth = 1;

    const gridSpacing = 80.0;
    for (double x = 0; x < size.width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
