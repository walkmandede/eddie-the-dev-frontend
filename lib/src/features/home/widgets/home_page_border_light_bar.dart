import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class HomePageBorderLightBar extends StatefulWidget {
  const HomePageBorderLightBar({super.key});

  @override
  State<HomePageBorderLightBar> createState() => _HomePageBorderLightBarState();
}

class _HomePageBorderLightBarState extends State<HomePageBorderLightBar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              painter: _BorderLightPainter(
                progress: _controller.value,
                color: AppColors.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BorderLightPainter extends CustomPainter {
  final double progress;
  final Color color;

  _BorderLightPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final perimeter = 2 * (w + h);
    final position = progress * perimeter;

    const barLength = 160.0;
    const steps = 80;

    for (int i = 0; i < steps; i++) {
      final t = i / steps;
      final segmentPos = (position - t * barLength + perimeter) % perimeter;
      final segmentEnd = (position - (t + 1 / steps) * barLength + perimeter) % perimeter;

      final p1 = _positionOnPerimeter(segmentPos, w, h);
      final p2 = _positionOnPerimeter(segmentEnd, w, h);

      final opacity = (1 - t);
      final strokeWidth = 4 * opacity;

      final paint = Paint()
        ..color = color.withOpacity(opacity * 0.9)
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * opacity);

      canvas.drawLine(p1, p2, paint);
    }

    final headPos = _positionOnPerimeter(position, w, h);
    final glowPaint = Paint()
      ..shader =
          RadialGradient(
            colors: [
              color.withOpacity(1.0),
              color.withOpacity(0.4),
              color.withOpacity(0.0),
            ],
            stops: const [0.0, 0.4, 1.0],
          ).createShader(
            Rect.fromCircle(center: headPos, radius: 10),
          )
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(headPos, 30, glowPaint);

    final corePaint = Paint()
      ..color = color.withOpacity(1.0)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      _positionOnPerimeter((position + 4 + perimeter) % perimeter, w, h),
      _positionOnPerimeter((position - 4 + perimeter) % perimeter, w, h),
      corePaint,
    );
  }

  Offset _positionOnPerimeter(double position, double w, double h) {
    final perimeter = 2 * (w + h);
    final p = position % perimeter;

    if (p < w) {
      return Offset(p, 0);
    } else if (p < w + h) {
      return Offset(w, p - w);
    } else if (p < 2 * w + h) {
      return Offset(w - (p - w - h), h);
    } else {
      return Offset(0, h - (p - 2 * w - h));
    }
  }

  @override
  bool shouldRepaint(_BorderLightPainter old) => old.progress != progress;
}
