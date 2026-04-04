import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IOSLiquidButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final double width;
  final double height;

  const IOSLiquidButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.width = 260,
    this.height = 58,
  });

  @override
  State<IOSLiquidButton> createState() => _IOSLiquidButtonState();
}

class _IOSLiquidButtonState extends State<IOSLiquidButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressCtrl;
  late Animation<double> _scaleAnim;
  late Animation<double> _rippleAnim;

  bool _pressed = false;
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _pressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.94,
    ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.elasticOut));
    _rippleAnim = CurvedAnimation(parent: _pressCtrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails d) {
    setState(() {
      _pressed = true;
      _tapPosition = d.localPosition;
    });
    _pressCtrl.forward(from: 0);
    HapticFeedback.lightImpact();
  }

  void _onTapUp(TapUpDetails _) {
    setState(() => _pressed = false);
    _pressCtrl.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() => _pressed = false);
    _pressCtrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _pressCtrl,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: CustomPaint(
                painter: _LiquidPainter(
                  color: widget.color,
                  pressed: _pressed,
                  rippleProgress: _rippleAnim.value,
                  tapPosition: _tapPosition,
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.icon, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        widget.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Painter – pure static liquid / gel / water look
// ─────────────────────────────────────────────────────────────
class _LiquidPainter extends CustomPainter {
  final Color color;
  final bool pressed;
  final double rippleProgress;
  final Offset tapPosition;

  _LiquidPainter({
    required this.color,
    required this.pressed,
    required this.rippleProgress,
    required this.tapPosition,
  });

  Color _lighten(Color c, double a) {
    final h = HSLColor.fromColor(c);
    return h.withLightness((h.lightness + a).clamp(0.0, 1.0)).toColor();
  }

  Color _darken(Color c, double a) {
    final h = HSLColor.fromColor(c);
    return h.withLightness((h.lightness - a).clamp(0.0, 1.0)).toColor();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.height / 2;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(r));

    // ── 1. Deep outer glow (water depth shadow) ──────────────
    for (int i = 3; i >= 1; i--) {
      final spread = i * 6.0;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            -spread / 2,
            spread / 2,
            size.width + spread,
            size.height + spread / 2,
          ),
          Radius.circular(r + spread / 2),
        ),
        Paint()
          ..color = _darken(color, 0.05).withOpacity(0.10 * i)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, spread * 2.2),
      );
    }

    // ── 2. Base gel body (radial gradient = sphere-like depth) ─
    canvas.drawRRect(
      rRect,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.2, -0.5),
          radius: 1.1,
          colors: [
            _lighten(color, 0.22),
            color,
            _darken(color, 0.18),
            _darken(color, 0.30),
          ],
          stops: const [0.0, 0.38, 0.72, 1.0],
        ).createShader(rect),
    );

    // ── 3. Inner subsurface glow (light trapped inside water) ─
    canvas.save();
    canvas.clipRRect(rRect);
    canvas.drawRRect(
      rRect,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(0.5, 0.6),
          radius: 0.8,
          colors: [_lighten(color, 0.35).withOpacity(0.25), Colors.transparent],
        ).createShader(rect)
        ..blendMode = BlendMode.screen,
    );
    canvas.restore();

    // ── 4. Primary specular blob (large wet highlight) ────────
    final specRect = Rect.fromLTWH(
      size.width * 0.08,
      size.height * 0.04,
      size.width * 0.55,
      size.height * 0.44,
    );
    canvas.save();
    canvas.clipRRect(rRect);
    canvas.drawOval(
      specRect,
      Paint()
        ..shader = RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: [
            Colors.white.withOpacity(0.55),
            Colors.white.withOpacity(0.18),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(specRect),
    );
    canvas.restore();

    // ── 5. Secondary specular dot (crisp "wet" point) ─────────
    final dotRect = Rect.fromLTWH(
      size.width * 0.14,
      size.height * 0.10,
      size.width * 0.18,
      size.height * 0.22,
    );
    canvas.save();
    canvas.clipRRect(rRect);
    canvas.drawOval(
      dotRect,
      Paint()
        ..shader = RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: [
            Colors.white.withOpacity(0.90),
            Colors.white.withOpacity(0.0),
          ],
        ).createShader(dotRect),
    );
    canvas.restore();

    // ── 6. Bottom caustic light (refraction at base) ──────────
    final causticRect = Rect.fromLTWH(
      size.width * 0.2,
      size.height * 0.62,
      size.width * 0.6,
      size.height * 0.32,
    );
    canvas.save();
    canvas.clipRRect(rRect);
    canvas.drawOval(
      causticRect,
      Paint()
        ..shader = RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: [
            Colors.white.withOpacity(0.12),
            Colors.white.withOpacity(0.0),
          ],
        ).createShader(causticRect),
    );
    canvas.restore();

    // ── 7. Rim / edge refraction border ───────────────────────
    canvas.drawRRect(
      rRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.38),
            Colors.white.withOpacity(0.04),
            Colors.white.withOpacity(0.15),
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // ── 8. Press ripple ───────────────────────────────────────
    if (rippleProgress > 0 && rippleProgress < 1) {
      final maxR = math.sqrt(
        math.pow(math.max(tapPosition.dx, size.width - tapPosition.dx), 2) +
            math.pow(math.max(tapPosition.dy, size.height - tapPosition.dy), 2),
      );
      canvas.save();
      canvas.clipRRect(rRect);
      canvas.drawCircle(
        tapPosition,
        rippleProgress * maxR,
        Paint()
          ..color = Colors.white.withOpacity((1 - rippleProgress) * 0.20)
          ..style = PaintingStyle.fill,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_LiquidPainter old) =>
      old.pressed != pressed ||
      old.rippleProgress != rippleProgress ||
      old.color != color;
}
