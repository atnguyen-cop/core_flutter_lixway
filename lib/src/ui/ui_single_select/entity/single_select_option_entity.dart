class SingleSelectOptionEntity<T> {
  final T item;
  final bool isSelected;
  const SingleSelectOptionEntity({required this.item, this.isSelected = false});
}