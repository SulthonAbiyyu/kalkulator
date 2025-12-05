import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/calculator_button.dart';
import '../widgets/calculator_display.dart';
import '../widgets/power_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: CalculatorDisplay(),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        // Row pertama dengan Power Button di sebelah kiri C
                        Expanded(
                          child: Row(
                            children: [
                              // Power Button di sebelah kiri
                              Padding(
                                padding: const EdgeInsets.only(right: 6, left: 6, top: 6, bottom: 6),
                                child: PowerButton(),
                              ),
                              // Tombol C
                              CalculatorButton(
                                text: 'C',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).clear(),
                                backgroundColor: const Color(0xFF94a3b8),
                                textColor: const Color(0xFF0f172a),
                              ),
                              CalculatorButton(
                                text: '±',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).toggleSign(),
                                backgroundColor: const Color(0xFF94a3b8),
                                textColor: const Color(0xFF0f172a),
                              ),
                              CalculatorButton(
                                text: '%',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).percentage(),
                                backgroundColor: const Color(0xFF94a3b8),
                                textColor: const Color(0xFF0f172a),
                              ),
                              CalculatorButton(
                                text: '÷',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).performOperation('÷'),
                                backgroundColor: const Color(0xFFf59e0b),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Rows selanjutnya tetap sama
                        Expanded(
                          child: Row(
                            children: [
                              CalculatorButton(
                                text: '7',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('7'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '8',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('8'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '9',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('9'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '×',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).performOperation('×'),
                                backgroundColor: const Color(0xFFf59e0b),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              CalculatorButton(
                                text: '4',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('4'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '5',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('5'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '6',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('6'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '-',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).performOperation('-'),
                                backgroundColor: const Color(0xFFf59e0b),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              CalculatorButton(
                                text: '1',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('1'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '2',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('2'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '3',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('3'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '+',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).performOperation('+'),
                                backgroundColor: const Color(0xFFf59e0b),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              CalculatorButton(
                                text: '0',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDigit('0'),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                                flex: 2,
                              ),
                              CalculatorButton(
                                text: '.',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).inputDecimal(),
                                backgroundColor: const Color(0xFF334155),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '=',
                                onPressed: () => Provider.of<CalculatorProvider>(context, listen: false).performOperation('='),
                                backgroundColor: const Color(0xFFf59e0b),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Kalkulator Matchaby',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
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