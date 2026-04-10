class OptionItem<T> {
  final T value;
  final String label;
  final String? icon;
  final String? description;
  OptionItem({required this.value, required this.label, this.icon, this.description});
}