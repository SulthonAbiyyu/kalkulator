import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class PowerButton extends StatefulWidget {
  const PowerButton({super.key});

  @override
  State<PowerButton> createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.90).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, calc, child) {
        return GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          onTap: () => calc.togglePower(),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF19b997),
                    Color(0xFF0788b6),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: -2,
                    offset: Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Color(0xFF0788b6).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, -2),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: -1,
                        offset: Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: CustomPaint(
                      key: ValueKey('power_${DateTime.now().microsecondsSinceEpoch}'),
                      size: Size(26, 26),
                      painter: PowerIconPainter(
                        isOn: calc.isPowerOn,
                        gradient: calc.isPowerOn
                            ? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF19b997),
                                  Color(0xFF0788b6),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  Color(0xFF94a3b8),
                                  Color(0xFF94a3b8),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PowerIconPainter extends CustomPainter {
  final bool isOn;
  final Gradient gradient;

  PowerIconPainter({required this.isOn, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawLine(
      Offset(center.dx, center.dy - size.height * 0.32),
      Offset(center.dx, center.dy + size.height * 0.05),
      paint,
    );

    final arcRect = Rect.fromCircle(
      center: center,
      radius: size.width * 0.35,
    );

    canvas.drawArc(
      arcRect,
      -0.60,
      4.28,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(PowerIconPainter oldDelegate) {
    return true;
  }
}