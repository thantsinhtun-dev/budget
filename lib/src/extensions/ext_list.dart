extension UniqueBy<T> on Iterable<T> {
  List<T> uniqueBy(dynamic Function(T) keySelector) {
    final seen = <dynamic>{};
    return where((element) => seen.add(keySelector(element))).toList();
  }
}