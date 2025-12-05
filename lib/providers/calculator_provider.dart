import 'package:flutter/foundation.dart';

class CalculatorProvider extends ChangeNotifier {
  String _display = '0';
  double? _previousValue;
  String? _operation;
  bool _waitingForOperand = false;
  bool _isPowerOn = false; // Tambahan untuk power state

  String get display => _display;
  bool get isPowerOn => _isPowerOn;

  void togglePower() {
    _isPowerOn = !_isPowerOn;
    if (!_isPowerOn) {
      // Reset semua saat power off
      _display = '0';
      _previousValue = null;
      _operation = null;
      _waitingForOperand = false;
    }
    notifyListeners();
  }

  void inputDigit(String digit) {
    if (!_isPowerOn) return; // Tidak bisa input jika power off
    
    if (_waitingForOperand) {
      _display = digit;
      _waitingForOperand = false;
    } else {
      _display = _display == '0' ? digit : _display + digit;
    }
    notifyListeners();
  }

  void inputDecimal() {
    if (!_isPowerOn) return;
    
    if (_waitingForOperand) {
      _display = '0.';
      _waitingForOperand = false;
    } else if (!_display.contains('.')) {
      _display = _display + '.';
    }
    notifyListeners();
  }

  void clear() {
    if (!_isPowerOn) return;
    
    _display = '0';
    _previousValue = null;
    _operation = null;
    _waitingForOperand = false;
    notifyListeners();
  }

  void performOperation(String nextOperation) {
    if (!_isPowerOn) return;
    
    final inputValue = double.tryParse(_display) ?? 0;

    if (_previousValue == null) {
      _previousValue = inputValue;
    } else if (_operation != null) {
      final currentValue = _previousValue ?? 0;
      final newValue = _calculate(currentValue, inputValue, _operation!);
      
      _display = _formatNumber(newValue);
      _previousValue = newValue;
    }

    _waitingForOperand = true;
    _operation = nextOperation;
    notifyListeners();
  }

  double _calculate(double firstValue, double secondValue, String operation) {
    switch (operation) {
      case '+':
        return firstValue + secondValue;
      case '-':
        return firstValue - secondValue;
      case '×':
        return firstValue * secondValue;
      case '÷':
        return secondValue != 0 ? firstValue / secondValue : 0;
      case '%':
        return firstValue % secondValue;
      default:
        return secondValue;
    }
  }

  String _formatNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    }
    return number.toString();
  }

  void toggleSign() {
    if (!_isPowerOn) return;
    
    final value = double.tryParse(_display) ?? 0;
    _display = _formatNumber(value * -1);
    notifyListeners();
  }

  void percentage() {
    if (!_isPowerOn) return;
    
    final value = double.tryParse(_display) ?? 0;
    _display = _formatNumber(value / 100);
    notifyListeners();
  }
}