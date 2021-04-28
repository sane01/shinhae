extension StringExtension on String {
  String intelliTrim() => this.length > 15 ? '${this.substring(0, 15)}...' : this;
}
