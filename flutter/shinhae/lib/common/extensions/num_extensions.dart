extension NumExtension on num {
  String convertToPercentageString() => ((this ?? 0) * 10).toStringAsFixed(0) + ' %';
}
