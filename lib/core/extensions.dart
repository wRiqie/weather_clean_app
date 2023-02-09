extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if(test(element)) return element; 
    }
    return null;
  }
}

extension StringExt on String {
  String get toCapitalized => this[0].toUpperCase() + substring(1);
}