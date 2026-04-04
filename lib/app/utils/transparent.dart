import 'dart:ui';
import 'package:flutter/material.dart';

class IOSGlassButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;

  const IOSGlassButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.width = 260,
    this.height = 60,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(height / 2);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: radius,

              // 🌫️ Glass gradient
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.white.withOpacity(0.10),
                  Colors.white.withOpacity(0.05),
                ],
              ),

              // 🧊 Border
              border: Border.all(
                color: Colors.white.withOpacity(0.35),
                width: 1.2,
              ),

              // 🌑 Soft shadow (very subtle)
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),

            child: Stack(
              children: [
                // ✨ Top highlight (important for realism)
                Positioned(
                  top: 4,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.25),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // 🔘 Content
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white.withOpacity(0.9),
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        label,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
